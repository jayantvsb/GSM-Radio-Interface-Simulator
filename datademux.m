%here we get back our original transmitted data signal from the received burst
%sequence in a single array
function x=datademux(x_1, x_2, x_3, x_4)
%t_1=[x_1(4:60), x_1(89:145)];
%t_2=[x_2(4:60), x_2(89:145)];
%t_3=[x_3(4:60), x_3(89:145)];
%t_4=[x_4(4:60), x_4(89:145)];
x(:,1)=x_1(4:60);
x(:,2)=x_1(89:145);
x(:,3)=x_2(4:60);
x(:,4)=x_2(89:145);
x(:,5)=x_3(4:60);
x(:,6)=x_3(89:145);
x(:,7)=x_4(4:60);
x(:,8)=x_4(89:145);