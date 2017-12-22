function Displacement= Displacement(Ebd,E)
K_global=globalstiffness(Ebd,E);
i=[1,2,3,4,5];
j=[3,4,5,7,8];
%% element the contrainted row and column
K(i,i)=K_global(j,j);
%% force matrix
f=[0;0;0;0;500*10^3];
%% displacement
D=K\f;
Displacement(j)=D(i);