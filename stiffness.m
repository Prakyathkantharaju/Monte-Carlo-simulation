function S = stiffness(E,theta,L)
%this function is to calculate the local stiffness matrix of the element
%since the area remians, i have delared the are here we can change the area
%here.
A=0.05;
l=cosd(theta);
m=sind(theta);
%i have intialized sin and cos to m and l for easy substitution%
X=(A*E)/(L);
Y=[l^2,l*m,-l^2,-l*m;l*m,m^2,-l*m,-m^2;-l^2,-l*m,l^2,l*m;-l*m,-m^2,l*m,m^2];
S=X*Y;
%this is the local stifness matrix of the given element