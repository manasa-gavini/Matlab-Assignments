Vcc=10;
Vs=3;
Vbe=0.7;
Rb=1000:1000:100000;
Rc=3000;
b=100;
Vt=0.026;
gain=
zeros(1,length(Rb));
for i=1:length(Rb)
    Ib=(Vs-Vbe)/Rb(i);
end
Ic=Ib*b;

Ie=Ib*(b+1);

Vc=Vcc-Ic*Rc;

if (Vc>Vbe)
    gm=Ic/Vt;
    rp=b/gm;
    re=Vt/Ie;
    gain=gm*Rc*rp/(rp+Rc);
else
    Vc=0;
end
    
plot(Rb,gain);    


