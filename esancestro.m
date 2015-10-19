function esancestro = esancestro(presuntopadre, presuntohijo, padres)
	i = presuntohijo;

	while (i > 0)
		if (i == presuntopadre)
			esancestro = true;
			return;
		endif

		i = padres(i);
	endwhile

	esancestro = false;
	return;

endfunction
