
%-------------------------------------------------------------------------%
function y=encoder_gsm(data_in)

data_class1a(1:50)=data_in(1:50);
crcGen=comm.CRCGenerator('z^3+z+1', 'ChecksumsPerFrame',1);
codeword=step(crcGen,data_class1a');
reset(crcGen);
y=codeword';
trellis = poly2trellis(5,{'1 + x^3 + x^4','1 + x + x^3 + x^4'});
y(54:185)=data_in(51:182);
y(186:189)=[1,1,1,1];
y_encode=convenc(y,trellis);
y_encode(379:456)=data_in(183:260);
y=y_encode;
%y_final(:378)=y_encode;
%y_final(379:)=data
end