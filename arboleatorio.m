function padres = arboleatorio(N)
	padres = zeros(N);

	for i = 2:N
		padres(i) = randi(N)
	endfor
endfunction
