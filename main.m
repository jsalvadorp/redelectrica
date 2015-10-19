
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
p.Imp = @grafica;     % funci�n de impresi�n
p.min = 1;

c0 = 1;               % temperatura inicial

r = recocido(p, c0);

display(r)



%    cadIntAcep: longitud de cadena en intentos aceptados
%         cadInt: longitud m�xima de cadena en intentos
%         maxCad: n�mero m�ximo de cadena de Markov sin mejora
%        frecImp: frecuencia de impresi�n de mejor encontrado
%             x0: estado inicial
%         FcnObj: funci�n objetivo
%         FcnVec: funci�n de vecindad
%            Imp: funci�n de impresi�n de estado
%        variarC: bandera que indica si se var�a la temperatura dentro de
%                 las cadenas de Markov (default = 0)
%           alfa: constante para disminuir la temperatura
%           beta: raz�n de aumento de temperatura en c�lculo de temperatura
%                 inicial
%     minRazAcep: m�nima raz�n de aceptaci�n para c�lculo de temperatura
%                 inicial
%            min: bandera que indica si se est� minimizando (default = 1)
