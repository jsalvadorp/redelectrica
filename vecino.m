function [npadres, nprod_acum, ncosto_acum] = vecino (padres, prod_acum, costo_acum, costo_unitario)
	N = length(padres);
	subarbol = 0;
	destino = 0;

	do
		subarbol = rand(2, N);
		destino = rand(1, N);

	until (not(ancestro(destino, subarbol)))

	npadres = padres(:);
	nprod_acum = prod_acum(:);
	ncosto_acum = costo_acum(:);

	% remover el subarbol del origen
	i = padre(subarbol);
	prod_sub = nprod_acum(subarbol);

	while (i > 0) % el padre de la raiz es 0 (sin padre)
		nprod_acum(i) = nprod_acum(i) - prod_sub;
		ncosto_acum(i) = costo_unitario(nprod_acum(i));

		prod_sub = nprod_acum(i);
		i = padre(i);
	endwhile



	% insertar el subarbol al destino
	i = destino;
	prod_sub = nprod_acum(subarbol);

	while (i > 0) % el padre de la raiz es 0 (sin padre)
		nprod_acum(i) = nprod_acum(i) + prod_sub;
		ncosto_acum(i) = costo_unitario(nprod_acum(i));

		prod_sub = nprod_acum(i);
		i = padre(i);
	endwhile

	padre(subarbol) = destino
endfunction
