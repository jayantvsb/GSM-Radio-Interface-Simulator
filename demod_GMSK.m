function [y1,y2,y3,y4]=demod_GMSK(x1,x2,x3,x4,z)
 f=900000000;
 fs=3*f;
 t=0:1/fs:1/f;
 hMod = comm.GMSKDemodulator('BitOutput', true, 'InitialPhaseOffset', pi/4,'BandwidthTimeProduct',0.3,'SamplesPerSymbol',8);  % setting up the GMSK DeModulator
 
 for i=1:1312
  x1_m(i)=match_filter(x1(i,:));  
  x2_m(i)=match_filter(x2(i,:)); 
  x3_m(i)=match_filter(x3(i,:)); 
  x4_m(i)=match_filter(x4(i,:)); 
end
 %[x1_m,x2_m,x3_m,x4_m]=estimator_corr(x1_m,x2_m,x3_m,x4_m,z,1);
 %const = step(hMod,ones(2,1)); % PAM constellation
 reset(hMod);
 y1_int = step(hMod,x1_m')';       % demodulation via Viterbi algorithm
 y1=y1_int(17:164);
 y1=diff_dec(y1);
 reset(hMod);                     % commented out since symbol prehistory
                                   %was stored while modulating
y2_int = step(hMod,x2_m')';       % demodulation via Viterbi algorithm
  
 y2=y2_int(17:164);
 y2=diff_dec(y2);
 reset(hMod);
 y3_int = step(hMod,x3_m')';       % demodulation via Viterbi algorithm
   
 y3=y3_int(17:164);
 y3=diff_dec(y3);
 reset(hMod);
 y4_int = step(hMod,x4_m')';       % demodulation via Viterbi algorithm
   
 
 y4=y4_int(17:164);
 y4=diff_dec(y4);
 
%  data_rx=diff_dec(y(17:608));  % differential decoder
%  y1=data_rx(1:148);
%  y2=data_rx(149:296);
%  y3=data_rx(297:444);
%  y4=data_rx(445:592);
%  
end