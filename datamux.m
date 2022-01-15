%here we have form the burst sequence containing the data in between training
%signals, flag bits and tail bits
%here the sequence size is 1x456
function [y_1, y_2, y_3, y_4]=datamux(m)
t=[0,0,1,0,0,1,0,1,1,1,0,0,0,0,1,0,0,0,1,0,0,1,0,1,1,1];
y_1 = [ones(1,3), m(1,:), 1, t, 1, m(2,:), ones(1,3)];
y_2 = [ones(1,3), m(3,:), 1, t, 1, m(4,:), ones(1,3)];
y_3 = [ones(1,3), m(5,:), 1, t, 1, m(6,:), ones(1,3)];
y_4 = [ones(1,3), m(7,:), 1, t, 1, m(8,:), ones(1,3)];
