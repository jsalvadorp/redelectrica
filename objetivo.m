function obj = objetivo(solucion) %(padres, prod_acum, costo_acum)
  % LENTO
  solucion.prod_acum = suma(solucion.padres, solucion.prod);
  % display(solucion.prod_acum)
  solucion.costo_acum = costo(solucion.padres, solucion.prod_acum, solucion.coords, solucion.costo_unitario);
  % display(solucion.costo_acum)
  % LENTO FIN
	obj = solucion.costo_acum(1);
endfunction
