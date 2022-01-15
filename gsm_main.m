clc
clear
np1=[0.1:0.1:1.5];
snr=(1./np1);
for no=1:10
    ber(no)=0;
for arj=1:50
   
rng('default');
np=0+(no-1)*0.2;                                     % noise power amplitude
data_in=rand(1,260)>0.5;                  % equiprobale data assumed to be the voice signal
y_k=encoder_gsm(data_in);                 % encoding the data with CRC and Convolutional codes
m=interleaver(y_k);                       % interleaving of the data
[x_1, x_2, x_3, x_4]=datamux(m);          % multiplexing of the datat to dataframes
[xm1,xm2,xm3,xm4,y_train]=modulator_GMSK(x_1, x_2, x_3, x_4);  % GMSK modulation after differtial encoding
[y_ch1,y_ch2,y_ch3,y_ch4,h1,h2,h3,h4]=mychn(xm1,xm2,xm3,xm4,np,'rician');                   % AWGN Channel % 'rayfad' for rayliegh fading,'rician' for rician fading
[ye1,ye2,ye3,ye4]=estimator_ls(y_ch1,y_ch2,y_ch3,y_ch4,xm1,h1,h2,h3,h4);
%[ye1,ye2,ye3,ye4]=estimator_corr(y_ch1,y_ch2,y_ch3,y_ch4,xm1,h1);
[y1,y2,y3,y4]=demod_GMSK(ye1,ye2,ye3,ye4,y_train);         % Viterbi demodulation
x_gsm=datademux(y1, y2, y3, y4);          % Data DeMux
n=deinterleaver(x_gsm);                   % Deinterleaving
clc % to supress n
y_m=decoder_gsm(n);                       % convolutional decoder
ber(no)=sum(biterr(data_in,y_m))+ber(no);                % BER
end
 BERc(no)=ber(no)/((260)*50);
end
% 
% 
np=[0:0.2:1.8];
stem(np,BERc,'LineWidth',1.5)
% 
xlabel('noise amp with respect to unity input')
title('BER for rician fading')
% stem(BERc,'LineWidth',1.5)
% % 
% xlabel('SNR at INput')
% title('BER for rician fading')