function [y1,y2,y3,y4,xk1,xk2,xk3,xk4]=mychn(x1,x2,x3,x4,k,str)
l=length(x1);
chan = [.986; .845; .237; .123+.31i]; % Channel coefficients
n1=k*sqrt(1/2)*((randn(l,4)+ 1j*randn(l,4)));
n2=k*sqrt(1/2)*((randn(l,4)+ 1j*randn(l,4)));
n3=k*sqrt(1/2)*((randn(l,4)+ 1j*randn(l,4)));
n4=k*sqrt(1/2)*((randn(l,4)+ 1j*randn(l,4)));
z_fill=zeros(1,7);
%ry_fad= sqrt(1/2)*(raylrnd(sqrt(1/2))+ 1j*raylrnd(sqrt(1/2)))
xk=[1,z_fill,1,z_fill,1+0.5j,z_fill,0,z_fill];
xk1=ch_fad(str);
xk2=ch_fad(str);
xk3=ch_fad(str);
xk4=ch_fad(str);
x1_fad=filter(xk1',1,x1);
x2_fad=filter(xk2',1,x2);
x3_fad=filter(xk3',1,x3);
x4_fad=filter(xk4',1,x4);
y1_fad=x1_fad+n1;
y2_fad=x2_fad+n2;
y3_fad=x3_fad+n3;
y4_fad=x4_fad+n4;
% y1=filter(1,xk1',y1_fad);
% y2=filter(1,xk2',y2_fad);
% y3=filter(1,xk3',y3_fad);
% y4=filter(1,xk4',y4_fad);
y1=y1_fad;
y2=y2_fad;
y3=y3_fad;
y4=y4_fad;


end