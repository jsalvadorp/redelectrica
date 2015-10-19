function prod_acum = suma(padre, prod)

  N = length(padre);

  A = zeros(N);
  for i=1:N
     if padre(i)~=0
        A(i,padre(i)) = 1;
     end
  end

  Aux = A;
  prod_acum = zeros(size(padre));    % potencia que enfía cada nodo a su padre
  while 1
     hojas = find(sum(Aux,1)==0);  % si el nodo raíz es hoja,
     if isequal(hojas,1)         % salir
        break
     end
     prod_acum(hojas) = prod_acum(hojas) + prod(hojas);  
     for i=1:length(hojas)
        prod_acum(padre(hojas(i))) = prod_acum(padre(hojas(i))) + prod_acum(hojas(i));
        Aux(hojas(i),:) = zeros(size(padre));
     end
     Aux(1,hojas) = 1;
     %display(A);
  end

endfunction