function [y1,y2,y3,y4]=estimator_ls(x1,x2,x3,x4,x_train,hac1,hac2,hac3,hac4)
x_seq1=x_train(64*8:8:87*8,1);
x_seq2=x_train(64*8:8:87*8,2);
x_seq3=x_train(64*8:8:87*8,3);
x_seq4=x_train(64*8:8:87*8,4);
y1_seq1=x1(69*8:8:87*8,1);
y1_seq2=x1(69*8:8:87*8,2);
y1_seq3=x1(69*8:8:87*8,3);
y1_seq4=x1(69*8:8:87*8,4);
y2_seq1=x2(69*8:8:87*8,1);
y2_seq2=x2(69*8:8:87*8,2);
y2_seq3=x2(69*8:8:87*8,3);
y2_seq4=x2(69*8:8:87*8,4);
y3_seq1=x3(69*8:8:87*8,1);
y3_seq2=x3(69*8:8:87*8,2);
y3_seq3=x3(69*8:8:87*8,3);
y3_seq4=x3(69*8:8:87*8,4);
y4_seq1=x4(69*8:8:87*8,1);
y4_seq2=x4(69*8:8:87*8,2);
y4_seq3=x4(69*8:8:87*8,3);
y4_seq4=x4(69*8:8:87*8,4);
k=6:-1:1;
x_seqmat1=trainmat(x_seq1);
x_seqmat2=trainmat(x_seq2);
x_seqmat3=trainmat(x_seq3);
x_seqmat4=trainmat(x_seq4);
%test=-1i*log(y1_seq1);
%opts = optimset(@lsqnonneg,'Display','off');
% xa_test = lsqnonneg((x_seqmat1),real(y1_seq1));
% xa_test1 = lsqnonneg((x_seqmat1),imag(y1_seq1));
% xb_test = lsqnonneg((x_seqmat2),real(y1_seq2));
% xb_test1 = lsqnonneg((x_seqmat2),imag(y1_seq2));
% xc_test = lsqnonneg((x_seqmat3),real(y1_seq3));
% xc_test1 = lsqnonneg((x_seqmat3),imag(y1_seq3));
% xd_test = lsqnonneg((x_seqmat4),real(y1_seq4));
% xd_test1 = lsqnonneg((x_seqmat4),imag(y1_seq4));
h1a=x_seqmat1\(y1_seq1);
h1b=x_seqmat2\y1_seq2;
h1c=x_seqmat3\y1_seq3;
h1d=x_seqmat4\y1_seq4;
h1=(h1a+h1b+h1c+h1d)/4;
h1=abs(real(h1))+1i*abs(imag(h1));
% x_test=(xa_test+xb_test+xc_test+xd_test)/4;
% x_test1=(xa_test1+xb_test1+xc_test1+xd_test1)/4;
%h1=x_test+(x_test1*1i);
h1ac=downsample(hac1,8);

h2a=x_seqmat1\y2_seq1;
h2b=x_seqmat2\y2_seq2;
h2c=x_seqmat3\y2_seq3;
h2d=x_seqmat4\y2_seq4;

h2=(h2a+h2b+h2c+h2d)/4;
h2=abs(real(h2))+1i*abs(imag(h2));
h2ac=downsample(hac2,8);

h3a=x_seqmat1\y3_seq1;
h3b=x_seqmat2\y3_seq2;
h3c=x_seqmat3\y3_seq3;
h3d=x_seqmat4\y3_seq4;
h3=(h3a+h3b+h3c+h3d)/4;
h3=abs(real(h3))+1i*abs(imag(h3));

h3ac=downsample(hac3,8);

h4a=x_seqmat1\y4_seq1;
h4b=x_seqmat2\y4_seq2;
h4c=x_seqmat3\y4_seq3;
h4d=x_seqmat4\y4_seq4;
h4=(h4a+h4b+h4c+h4d)/4;
h4=abs(real(h4))+1i*abs(imag(h4));

h4ac=downsample(hac4,8);

% h2=x_seqmat1\y2_seq;
% h3=x_seqmat1\y3_seq;
% h4=x_seqmat1\y4_seq;
h1_up=upsample(h1,8);
h2_up=upsample(h2,8);
h3_up=upsample(h3,8);
h4_up=upsample(h4,8);
y1=filter(1,h1_up',x1);
y2=filter(1,h2_up',x2);
y3=filter(1,h3_up',x3);
y4=filter(1,h4_up',x4);
no=0;
end