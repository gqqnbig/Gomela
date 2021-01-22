package promela

import (
	"go/ast"
	"go/token"
	"go/types"

	"golang.org/x/tools/go/packages"
)

// Return the channels and the waitgroups that are created in the scope of a function body's until call_expr is reached
func AnalyseFuncCall(fileSet *token.FileSet, fun *ast.FuncDecl, call_expr *ast.CallExpr, pack *packages.Package) (chans []ast.Expr, wgs []ast.Expr) {

	chans = []ast.Expr{}
	wgs = []ast.Expr{}

	call_expr_reached := false
	ast.Inspect(fun.Body, func(n ast.Node) bool {

		if !call_expr_reached {
			switch n := n.(type) {
			case *ast.CallExpr:
				if call_expr == n {
					call_expr_reached = true
				}
			case *ast.AssignStmt:
				for _, l := range n.Lhs {
					switch s := pack.TypesInfo.TypeOf(l).(type) {
					case *types.Named:
						switch s := s.Underlying().(type) {
						case *types.Struct:
							for i := 0; i < s.NumFields(); i++ {
								switch field := s.Field(i).Type().(type) {
								case *types.Named:
									if field.Obj() != nil {
										if field.Obj().Pkg() != nil {
											if field.Obj().Pkg().Name() == "sync" {
												if field.Obj().Name() == "WaitGroup" {
													wgs = append(wgs, &ast.Ident{Name: translateIdent(l).Name + "_" + s.Field(i).Name(), NamePos: l.Pos()})
												}
											}
										}

									}
								}
							}
						}
					}
				}
				for i, rhs := range n.Rhs {
					switch rhs := rhs.(type) {
					case *ast.UnaryExpr:
						n.Rhs[i] = rhs.X
					}
				}
				for i, rhs := range n.Rhs {
					switch rhs := rhs.(type) {
					case *ast.CallExpr:
						switch ident := rhs.Fun.(type) {
						case *ast.Ident:
							if ident.Name == "make" && len(rhs.Args) > 0 { // possibly a new chan
								switch rhs.Args[0].(type) {
								case *ast.ChanType:
									chans = append(chans, n.Lhs[i])
								}
							}
						case *ast.SelectorExpr:
							if ident.Sel.Name == "WaitGroup" {
								switch sel := ident.X.(type) {
								case *ast.Ident:
									if sel.Name == "sync" {
										// we have a waitgroup
										if len(n.Lhs) > i {
											wgs = append(wgs, n.Lhs[i])
										}
									}
								}
							}
						}
					case *ast.CompositeLit:
						switch sel := rhs.Type.(type) {
						case *ast.SelectorExpr:
							if sel.Sel.Name == "WaitGroup" {
								switch sel := sel.X.(type) {
								case *ast.Ident:
									if sel.Name == "sync" {
										// we have a waitgroup
										for _, name := range n.Lhs {
											wgs = append(wgs, name)
										}
									}
								}
							}
						}
					}
				}
			case *ast.DeclStmt:
				switch decl := n.Decl.(type) {
				case *ast.GenDecl:
					for _, spec := range decl.Specs {
						switch spec := spec.(type) {
						case *ast.ValueSpec:
							for i, rhs := range spec.Values {
								switch call := rhs.(type) {

								case *ast.CallExpr:
									switch ident := call.Fun.(type) {
									case *ast.Ident:
										if ident.Name == "make" && len(call.Args) > 0 { // possibly a new chan
											switch call.Args[0].(type) {
											case *ast.ChanType:

												chans = append(chans, spec.Names[i])
											}
										}
									}
								}
							}

							// check if its the declaration of a WG
							switch sel := spec.Type.(type) {
							case *ast.SelectorExpr:
								if sel.Sel.Name == "WaitGroup" {
									switch sel := sel.X.(type) {
									case *ast.Ident:
										if sel.Name == "sync" {
											// we have a waitgroup
											for _, name := range spec.Names {
												wgs = append(wgs, name)
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		return !call_expr_reached
	})

	// Add the chan parameter to the list
	for _, field := range fun.Type.Params.List {
		switch field.Type.(type) {
		case *ast.ChanType:
			for _, name := range field.Names {
				chans = append(chans, name)
			}
		}
	}

	return chans, wgs
}
