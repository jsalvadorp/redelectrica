




%% caso 2

% Padre del nodo i
padre = [0 3 7 3 4 7 9 6 1 7 10];

% Producci�n del nodo i
prod = [0 3 3 3 10 4 5 5 14 12 2];

% Coordenadas
C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3];

N = length(padre);

costo_unitario = @(capacidad) ifelse(capacidad <=  5, 10,
															ifelse(capacidad <= 10, 15,
															ifelse(capacidad <= 20, 20,
															ifelse(capacidad <= 40, 30,
																											40)))); % <= 80

%% recocido

arbol = randinit(prod, C, costo_unitario);
display(objetivo(arbol))
% RECOCIDO

p.cadIntAcep = 80;
p.cadInt = 500;
p.maxCad = 1;
p.frecImp = 100;
p.alfa = 0.80;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = arbol;
p.FcnObj = @objetivo;
p.FcnVec = @vecino;
p.Imp = @grafica;     % funci�n de impresi�n
p.min = 1;

c0 = 1;               % temperatura inicial

% r = recocido(p, c0);



[x,prom,desv] = plotRecocido(p,20,c0);