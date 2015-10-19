
% Datos CASO 1

padre = [0 5 4 6 1 5 6];
prod = [0 10 5 3 4 9 8];

% Coordenadas
C = [0 0;3 2;6 2;6 0;3 -2;6 -2;9 -2];
costo_unitario = @(capacidad)  2 + capacidad.^0.6;

arbol = randinit(prod, C, costo_unitario)

% % START
% N = length(padre);
% prod_acum = suma(padre, prod)
% costo_acum = costo(padre, prod_acum, C, costo_unitario)
% % [npadre, nprod_acum, ncosto_acum] = vecino(padre, prod_acum, costo_acum, costo_unitario, C)
% [npadre, nprod_acum, ncosto_acum] = vecino(padre, prod_acum, costo_acum, costo_unitario, C)

% grafica(npadre, prod, C, nprod_acum)
