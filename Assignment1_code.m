clear all
format long
syms r

T1 = 70;
 T2 = 25;
 r1 = 0.5;
 h = 20;

 Q1 = (2*(3.14)*45)/(((log(r/0.0005))/(0.2))*2.303 + 1/(0.2*r));
 
 figure
fplot(Q1,[0 3000])


Q2= (2*(3.14)*45)/(((log(r/0.5))/(0.4))*2.303 + 1/(0.0002*r));
figure
fplot(Q2,[0 3000])

Q3= (2*(3.14)*45)/(((log(r/0.5))/(0.026))*2.303 + 1/(0.0002*r));

 figure
fplot(Q3,[0 3000])

fprintf('Q is max. for Polyethylene, for r=0.56m')



