


%% caso 3

% Padre del nodo i
%        0  1  2  3  4  5  6  7  8  9 10 11 12 13 14
padre = [0 14  7  3  4  7  9  6 15  7 10  8  8  1  1];

% Producci�n del nodo i
prod = [0 3 3 3 10 4 5 5 14 12 2 5 8 10 13];

% Coordenadas
C = [0 1.5; 1 0; 2 0; 3 0; 5 0; 3 1.5; 2 2; 4 2; 1 3; 3 3; 5 3; 5 1;5 2;0 0;0 3];

N = length(padre);

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

r = recocido(p, c0);