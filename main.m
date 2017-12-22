%% this section is to create 'i' random normal distribution variable
clear;
clc;
tic
%this the main file for the part a of the project 1. in this file i have
%build. 
%main file will call the function to solve for the displacement repeatedly
i=input('enter the iteration');
%this is the number of random variable this will be changed every time
EBD=input('the mean of the youngs modulus BD');
ESTD=input('standard deviation of the youngs modulus of BD');
Eother=input('enter the youngs modulus of the other element');
R= normrnd(EBD,ESTD,[1,i]);
%% verification of the random variable this part is option
verify_sum=sum(R);
verify_mu=(verify_sum/i);
verify_varience=(sum((R-verify_mu).^2))/i;
verify_sigma=sqrt(verify_varience);
verify=normpdf(R,verify_mu,verify_sigma);
subplot(3,3,1)
plot(R,verify,'.')
title('verified pdf');
%% assign the random variable to the displacement function
Dout(8)=0;
for t=(1:i)
    Ebd=R(t);
    D=Displacement(Ebd,Eother);
    Dout=[Dout;D];
end
%% getting the u and v and assign to elimnate the firstrow
U_temp=Dout(:,7);
V_temp=Dout(:,8);
x=[1:i];
y=[2:i+1];
V(x)=V_temp(y);
U(x)=U_temp(y);
display('monte carlo simulation')
%% find the mean and standard deviation of the displacement U
Umean=mean(U);
U_var=var(U);
U_std=std(U);
Updf=normpdf(U,Umean,U_std);
subplot(3,3,2)
plot(U,Updf);
title('normal distribution of the displacement U')
%% find the mean and standard deviation of the displacement V
Vmean=mean(V);
V_var=var(V);
V_std=std(V);
Vpdf=normpdf(V,Vmean,V_std);
subplot(3,2,3)
plot(V,Vpdf);
title('normal distribution of the displacement V')
%% this is the hist plot to show the distribution of the displacement U
subplot(3,2,4)
histfit(U);
title('normal distribution of U at B')
subplot(3,2,5)
histfit(V);
title('normal distribution of V at b')
%% to find the ub and vb at P=0.1
ub=norminv(0.1,Umean,U_std)
Vb=norminv(0.1,Vmean,V_std)
toc