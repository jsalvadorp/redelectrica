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
	vecino.costo_unitario = solucion.costo_unitario;

	% remover el subarbol del origen
	padre = solucion.padres(subarbol);
	prod_sub = solucion.prod_acum(subarbol);

	% arista_solucion = solucion.costo_unitario(solucion.prod_acum(actual))
	%		* distancia(solucion.coords(padre), solucion.coords(actual));

	while (padre > 0)
		vecino.prod_acum(padre) -= prod_sub;
		padre = solucion.padres(padre);
	endwhile

	actual = solucion.padres(subarbol);
	padre = solucion.padres(actual);

	delta = 0 - solucion.costo_acum(subarbol) - solucion.costo_unitario(solucion.prod_acum(subarbol)) * distancia(solucion.coords(padre), solucion.coords(actual));

	vecino.costo_acum(actual) += delta;

	while (padre > 0)
		% restar arista anterior
		arista_anterior = solucion.costo_unitario(solucion.prod_acum(padre)) * distancia(solucion.coords(padre), solucion.coords(actual));
		arista_nuevo = vecino.costo_unitario(vecino.prod_acum(padre)) * distancia(vecino.coords(padre), vecino.coords(actual));
		delta += arista_nuevo - arista_anterior;

		vecino.costo_acum(padre) += delta;
		actual = padre;
		padre = solucion.padres(padre);
	endwhile

	% insertar el subarbol al destino
	padre = destino;
	actual = subarbol;

	while (padre > 0)
		vecino.prod_acum(padre) += prod_sub;
		vecino.costo_acum(padre) += vecino.costo_acum(actual) + solucion.costo_unitario(vecino.prod_acum(actual)) * distancia(solucion.coords(padre), solucion.coords(actual));

		actual = solucion.padres(actual);
		padre = solucion.padres(actual);
	endwhile

	vecino.padres(subarbol) = destino;
endfunction

function dist = distancia(x, y)
	dist = norm(x - y, 2);
endfunction
