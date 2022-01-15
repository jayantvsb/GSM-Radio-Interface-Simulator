function y=match_filter(y1_mod)
 f=900000000;
 fs=3*f;
 t=0:1/fs:1/f;
 count=length(t);
 y1_matchc(:)=y1_mod.*cos(2*pi*f*t);
 y1_matchs(:)=y1_mod.*sin(2*pi*f*t);
 %y1_sumc=0.7071*(2*(sum(y1_matchc)>0)-1);
 %y1_sums=0.7071*(2*(sum(y1_matchs)<0)-1); 
 y1_sumc=sum(y1_matchc)/length(t);
 y1_sums=sum(y1_matchs)/length(t); 
 y=y1_sumc+(1i*y1_sums);
end