function s = randinit(prod, C, costo_unitario)
  N = length(prod);
  s.padres = arboleatorio(N);
  s.prod = prod;
  s.coords = C;
  s.costo_unitario = costo_unitario;
  s.prod_acum = suma(s.padres, s.prod);
  s.costo_acum = costo(s.padres, s.prod_acum, s.coords, s.costo_unitario);
  grafica(s);
endfunction
