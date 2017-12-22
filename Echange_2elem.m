%% this section is to generate the random variable for Ebd and Eab
clc;
clear;
tic
j=40000;
R1=normrnd(200,50,[1,j]);
R2=normrnd(200,50,[1,j]);
%% verify R1 and R2 
R1_mean=mean(R1);
R2_mean=mean(R2);
R1_std=std(R1);
R2_std=std(R2);
subplot(3,3,1)
histfit(R1)
title('E of AB element distribution');
subplot(3,3,2)
histfit(R2)
title('E of BD element distribution');
Dout(8)=0;
for i=1:j;
    Eab=R1(i);
    Ebd=R2(i);
    D=Displacement2(Ebd,Eab);
    Dout=[Dout;D];
end
U_temp=Dout(:,7);
V_temp=Dout(:,8);
x=[1:j];
y=[2:j+1];
V(x)=V_temp(y);
U(x)=U_temp(y);
subplot(3,3,3) 
histfit(U);
title('distribution of U at B')
subplot(3,3,4)
histfit(V);
title('distribution of V at B')
%% finding the mean, varience and standard deviation
Umean=mean(U)
U_var=var(U);
U_std=std(U)
Vmean=mean(V)
V_var=var(V);
V_std=std(V)
%% probaility distribution
Updf=normpdf(U);
subplot(3,3,5)
plot(U,Updf,'.');
title('normal probability distribution of the displacement U')
Vpdf=normpdf(V);
subplot(3,3,6)
plot(V,Vpdf,'.');
title('normalprobability distribution of the displacement V')
%% to find the Ub and Vb 
Ub=norminv(0.1,Umean,U_std)
Vb=norminv(0.1,Vmean,V_std)
%% 
Ur=normpdf(U,Umean,U_std);
subplot(3,3,7)
plot(U,Ur,'.')
Vr=normpdf(V,Vmean,V_std);
subplot(3,3,8)
plot(U,Ur,'.')
% Udist=makedist('normal',Umean,U_std);
% U_norm=normpdf(Udist)
% plot(U,U_norm)
toc