
% Datos CASO 1

padre = [0 5 4 6 1 5 6];
prod = [0 10 5 3 4 9 8];

% Coordenadas
% C = [0 0; 3 2; 6 2; 6 0; 3 -2; 6 -2; 9 -2];   % ORIGNAL
C = [0 0; 3 2; 6 2; 5 0; 3 -2; 6 -2; 9 -2];
costo_unitario = @(capacidad)  2 + capacidad.^0.6;

% START

arbol = randinit(prod, C, costo_unitario);

% RECOCIDO

p.cadIntAcep = 40;
p.cadInt = 80;
p.maxCad = 1;
p.frecImp = 5;
p.alfa = 0.80;
p.beta = 1.2;
p.minRazAcep = 0.90;
p.variarC = 0;
p.x0 = arbol;
p.FcnObj = @objetivo;
p.FcnVec = @vecino;
p.Imp = @grafica;     % función de impresión
p.min = 1;

c0 = 1;               % temperatura inicial

r = recocido(p, c0);

display(r)



%    cadIntAcep: longitud de cadena en intentos aceptados
%         cadInt: longitud máxima de cadena en intentos
%         maxCad: número máximo de cadena de Markov sin mejora
%        frecImp: frecuencia de impresión de mejor encontrado
%             x0: estado inicial
%         FcnObj: función objetivo
%         FcnVec: función de vecindad
%            Imp: función de impresión de estado
%        variarC: bandera que indica si se varía la temperatura dentro de
%                 las cadenas de Markov (default = 0)
%           alfa: constante para disminuir la temperatura
%           beta: razón de aumento de temperatura en cálculo de temperatura
%                 inicial
%     minRazAcep: mínima razón de aceptación para cálculo de temperatura
%                 inicial
%            min: bandera que indica si se está minimizando (default = 1)