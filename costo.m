function costo_acum = costo(padre, prod_acum, C, costo_unitario)

  % Función de costo unitario para caso 1 (debe cambiarse para el caso 2 y 3)
  % costo_unitario = @(capacidad)  2 + capacidad.^0.6;

  N = length(padre);

  D = zeros(N);
  for i=1:N
     for j=i+1:N
        D(i,j) = norm(C(i,:)-C(j,:));
        D(j,i) = D(i,j);
     end
  end
  % Matriz de distancias
  % display(D)

  costo_arista = costo_unitario(prod_acum).*[0;diag(D(2:N,padre(2:N)))]';

  % Costo por arista
  % fprintf('El costo total es: %f\n',sum(costo_arista))

  % Costo acumulado(no inclusivo)

  A = zeros(N);
  for i=1:N
     if padre(i)~=0
        A(i,padre(i)) = 1;
     end
  end

  Aux = A;
  costo_acum = zeros(size(padre));    % potencia que enfía cada nodo a su padre
  while 1
     hojas = find(sum(Aux,1)==0);  % si el nodo raíz es hoja,
     if isequal(hojas,1)         % salir
        break
     end
     costo_acum(hojas) = costo_acum(hojas) + costo_arista(hojas);

     % display(hojas)
     % display(costo_acum(hojas))

     for i=1:length(hojas)
        costo_acum(padre(hojas(i))) = costo_acum(padre(hojas(i))) + costo_acum(hojas(i));
        Aux(hojas(i),:) = zeros(size(padre));
     end

     costo_acum(hojas) = costo_acum(hojas) - costo_arista(hojas);

     Aux(1,hojas) = 1;
     % display(A);
  end


endfunction