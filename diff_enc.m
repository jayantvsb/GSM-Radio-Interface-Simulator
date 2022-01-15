function y=diff_enc(x)
l=length(x);
x_prev=[0,x(1:l-1)];
y=xor(x,x_prev);
%y=x;
y=y;
end