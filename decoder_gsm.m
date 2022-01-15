function y=decoder_gsm(data_enc)
y(183:260)=data_enc(379:456);
tb = 1;
trellis = poly2trellis(5,{'1 + x^3 + x^4','1 + x + x^3 + x^4'}); % Trellis for the convolution code
tb=1;
decoded = vitdec(data_enc(1:378),trellis,tb,'trunc','hard');     % decoding of the output
%y=decoded;
 detect = comm.CRCDetector('z^3+z+1','ChecksumsPerFrame',1);     % check for the CRC of the block code.Retransmit if fails
 [~, err] = step(detect,decoded(1:53)');
 %if err==0
     y(1:50)=decoded(1:50);
     y(51:182)=decoded(54:185);
 %else
    % y=0;              % incase of error
 %end


end