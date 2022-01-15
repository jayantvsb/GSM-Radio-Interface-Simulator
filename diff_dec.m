function y=diff_dec(x)
l=length(x);
x_prev=0;
for i=1:l
    y(i)=xor(x(i),x_prev);
    x_prev=y(i);  
end


end