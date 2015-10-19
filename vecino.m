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
	vecino.coords = solucion.coords;
	vecino.costo_unitario = solucion.costo_unitario;
	vecino.prod_acum = solucion.prod_acum;
	vecino.costo_acum = solucion.costo_acum;


	vecino.padres(subarbol) = destino;
endfunction

function dist = distancia(x, y)
	dist = norm(x - y, 2);
endfunction
