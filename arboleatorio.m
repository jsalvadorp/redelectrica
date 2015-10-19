function padres = arboleatorio(N)
	padres = zeros(1, N);

	for i = 2:N
		padres(i) = randi(i - 1);
	endfor
endfunction
