function K =globalstiffness(Ebd,E)
%this function is to obtain the global stiffness matrix
%% generated local stiffness matrix
AB=stiffness(E,45,4.2426);
BD=stiffness(Ebd,90,3);
CB=stiffness(E,120,3.4641);
CD=stiffness(E,0,1.73205);
AD=stiffness(E,0,3);
%above are the stiffness matrix for 5 of the elements got by assign the E
%L and theta
%% nodal assignment
%each term is a nodal assignment for the different element
i=[1,2,3,4];
p=[1,2,7,8];
r=[3,4,7,8];
t=[5,6,7,8];
v=[3,4,5,6];
e=[7,8];
x=[1,2,3,4];
g=[5,6,7,8];
% here odd numbers in p,r,t,v,x represents 'u' and even number 'v' at there
% respective nodes
%% getting local matrix in the 8x8 matrix with respective node
K1(p,p)=AB(i,i); % in element AB the nodes are 1,2,7,8
K2(r,r)=BD(i,i); % in element BD the nodes are 3,4,7,8
K3(t,t)=CB(i,i); % in element CB the nodes are 5,6,7,8
K4(v,v)=CD(i,i); % in element CD the nodes are 3,4,5,6
%this step this to initialize the local stiffness matrix to global
K4(e,e)=0; %this step to make sure the size of the matrix k is same to facilitate
%addition
K5(x,x)=AD(i,i); % in element AD the nodes are 1,2,3,4
K5(g,g)=0;
%% global stiffness matrix
K=K1+K2+K3+K4+K5;