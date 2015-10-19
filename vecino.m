function [npadres, nprod_acum, ncosto_acum] = vecino (padres, prod_acum, costo_acum, costo_unitario, coords)
	N = length(padres);
	subarbol = 0;
	destino = 0;

	do
		subarbol = 1 + randi(N - 1); % rand entre 2 y N
		destino = randi(N); % rand entre 1 y N

	until (not(ancestro(subarbol, destino, padres)))

	npadres = padres(:);
	nprod_acum = prod_acum(:);
	ncosto_acum = costo_acum(:);

	% remover el subarbol del origen
	padre = padres(subarbol);
	actual = subarbol;

	while (padre > 0)
		nprod_acum(padre) -= nprod_acum(actual);
		ncosto_acum(padre) -=
			ncosto_acum(actual)
			+ costo_unitario(nprod_acum(actual)) * distancia(coords(padre), coords(actual));

		actual = padres(actual);
		padre = padres(actual);
	endwhile



	% insertar el subarbol al destino
	padre = padres(destino);
	actual = destino;

	while (padre > 0)
		nprod_acum(padre) += nprod_acum(actual);
		ncosto_acum(padre) +=
			ncosto_acum(actual)
			+ costo_unitario(nprod_acum(actual)) * distancia(coords(padre), coords(actual));

		actual = padres(actual);
		padre = padres(actual);
	endwhile

	padre(subarbol) = destino
endfunction

function esancestro = ancestro(presuntopadre, presuntohijo, padres)
	i = presuntohijo

	while (i > 0)
		if (i == padre)
			esancestro = true;
			return;
		endif
	endwhile

	esancestro = false;
	return;

endfunction
