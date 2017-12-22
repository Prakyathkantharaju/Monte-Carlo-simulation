function Displacement= Displacement2(Ebd,Eab)
K_global=globalstiffness2(Ebd,Eab);
i=[1,2,3,4,5];
j=[3,4,5,7,8];
%% element the contrainted row and column
K(i,i)=K_global(j,j);
%% force matrix
f=[0;0;0;0;500*10^3];
%% displacement
D=K\f;
Displacement(j)=D(i);