function h=ch_fad(str)
if str=='rayfad'
    rng('default');
    ry_fad= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1)));
    ry_fad1= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1/2)));
    ry_fad2= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1/2)));
    ry_fad3= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1/2)));
    ry_fad4= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1/2)));
    ry_fad5= sqrt(1/2)*(raylrnd((1/2))+ 1i*raylrnd((1/2)));
    z_fill=zeros(1,7);
    h=1.5*[ry_fad,z_fill,exp(-1)*ry_fad1,z_fill,exp(-2)*ry_fad2,z_fill,exp(-3)*ry_fad3,z_fill,exp(-4)*ry_fad4,z_fill,exp(-5)*ry_fad5,z_fill];
elseif str=='rician'
     rng('default');
    ric_fad=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    ric_fad1=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    ric_fad2=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    ric_fad3=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    ric_fad4=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    ric_fad5=sqrt(1/2)*(random('rician',1,0.5)+1i*random('rician',1,0.5));
    z_fill=zeros(1,7);
    h=1.5*[ric_fad,z_fill,exp(-1)*ric_fad1,z_fill,exp(-2)*ric_fad2,z_fill,exp(-3)*ric_fad3,z_fill,exp(-4)*ric_fad4,z_fill,exp(-5)*ric_fad5,z_fill];
end
end
