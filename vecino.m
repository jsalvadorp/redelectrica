function vecino = vecino(solucion)
	N = length(solucion.padres);
	subarbol = 0;
	destino = 0;

	do
		subarbol = 1 + randi(N - 1); % rand entre 2 y N
		destino = randi(N); % rand entre 1 y N

	until (not(esancestro(subarbol, destino, solucion.padres)))

	% copias
	vecino.padres = solucion.padres;
	vecino.prod = solucion.prod;

	vecino.prod_acum = solucion.prod_acum;
	vecino.costo_acum = solucion.costo_acum;
	vecino.coords = solucion.coords;

	% remover el subarbol del origen
	padre = solucion.padres(subarbol);
	actual = subarbol;

	while (padre > 0)
		vecino.prod_acum(padre) -= vecino.prod_acum(actual);
		vecino.costo_acum(padre) -= vecino.costo_acum(actual) + solucion.costo_unitario(vecino.prod_acum(actual)) * distancia(solucion.coords(padre), solucion.coords(actual));

		actual = solucion.padres(actual);
		padre = solucion.padres(actual);
	endwhile



	% insertar el subarbol al destino
	padre = solucion.padres(destino);
	actual = destino;

	while (padre > 0)
		vecino.prod_acum(padre) += vecino.prod_acum(actual);
		vecino.costo_acum(padre) += vecino.costo_acum(actual) + solucion.costo_unitario(vecino.prod_acum(actual)) * distancia(solucion.coords(padre), solucion.coords(actual));

		actual = solucion.padres(actual);
		padre = solucion.padres(actual);
	endwhile

	vecino.padres(subarbol) = destino;
endfunction

function dist = distancia(x, y)
	dist = norm(x - y, 2);
endfunction
