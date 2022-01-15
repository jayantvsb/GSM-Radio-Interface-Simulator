function [y1_mod,y2_mod,y3_mod,y4_mod,y1]=modulator_GMSK(x_1,x_2,x_3,x_4)
 f=900000000;
 fs=3*f;
 t=0:1/fs:1/f;
 data_tx=[x_1,x_2,x_3,x_4];
 %data_diff=diff_enc(data_tx);            % diff encoding of the input
 %data_txdif=[data_diff,zeros(1,16)]';   % accounting for the delay of the Viterbi algorithm 
 hMod = comm.GMSKModulator('BitInput', true, 'InitialPhaseOffset', pi/4,'BandwidthTimeProduct',0.3,'SamplesPerSymbol',8);  % setting up the GMSK Modulator
 x_1d=diff_enc(x_1);
 x_2d=diff_enc(x_2);
 x_3d=diff_enc(x_3);
 x_4d=diff_enc(x_4);
 
 reset(hMod);
 y1 = step(hMod,[x_1d,zeros(1,16)]');               % Modulation operation
 reset(hMod);
 %y1_mod=real(y1)*cos(2*pi*t)-imag(y1)*sin(2*pi*t);   % converting to bandpass
 y2 = step(hMod,[x_2d,zeros(1,16)]');               % Modulation operation
 reset(hMod);
 %y2_mod=real(y2)*cos(2*pi*t)-imag(y2)*sin(2*pi*t);   % converting to bandpass
 y3 = step(hMod,[x_3d,zeros(1,16)]');               % Modulation operation
 reset(hMod);
 %y3_mod=real(y3)*cos(2*pi*t)+imag(y3)*sin(2*pi*t);   % converting to bandpass
 y4 = step(hMod,[x_4d,zeros(1,16)]');               % Modulation operation
 %y4_mod=real(y4).*cos(2*pi*t)+imag(y4)*sin(2*pi*t);   % converting to bandpass
 for i=1:1312
  y1_mod(i,:)=real(y1(i))*cos(2*pi*f*t)-imag(y1(i))*sin(2*pi*f*t);   % converting to bandpass   
  y2_mod(i,:)=real(y2(i))*cos(2*pi*f*t)-imag(y2(i))*sin(2*pi*f*t);   % converting to bandpass
  y3_mod(i,:)=real(y3(i))*cos(2*pi*f*t)-imag(y3(i))*sin(2*pi*f*t);   % converting to bandpass
  y4_mod(i,:)=real(y4(i))*cos(2*pi*f*t)-imag(y4(i))*sin(2*pi*f*t);   % converting to bandpass

 end

 %------------------------------------------------------------------match filering------------------------------------%
% for i=1:164
%     y1_matchc(i,:)=y1_mod(i,:).*cos(2*pi*f*t);
%     y1_matchs(i,:)=y1_mod(i,:).*sin(2*pi*f*t);
%     y1_sumc(i)=sum(y1_matchc(i,:));
%     y1_sums(i)=sum(y1_matchs(i,:));    
% end
m=0;
end