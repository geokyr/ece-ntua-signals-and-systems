%1.2.a
z = [1.2;-0.6];
p = [0.68+0.51*j;0.68-0.51*j];

figure;
zplane(z,p);

[b,a] = zp2tf(z,p,1);

%1.2.b
figure;
freqz(b,a);

%1.2.c
[x,t] = impz(b,a);
figure;
stem(t,x);

stepz(b,a,100);

%1.2.d
p1 = [0.76+0.57*j;0.76-0.57*j];
p2 = [0.8+0.6*j;0.8-0.6*j];
p3 = [0.84+0.63*j;0.84-0.63*j];

[bp1,ap1] = zp2tf(z,p1,1);
[bp2,ap2] = zp2tf(z,p2,1);
[bp3,ap3] = zp2tf(z,p3,1);

stepz(bp1,ap1,100);
stepz(bp2,ap2,100);
stepz(bp3,ap3,100);

figure;
freqz(bp1,ap1);

%1.2.e
[u1,t1] = gensig("pulse",50,100,1);
[u2,t2] = gensig("pulse",5,100,1);

y1 = filter(b,a,[u1,t1]);
y2 = filter(b,a,[u2,t2]);

figure;
plot(y1(:,1));
figure;
plot(y2(:,1));

%1.2.st
p4 = [0+0.8*j;0-0.8*j];

figure;
zplane(z,p4);

[bp4,ap4] = zp2tf(z,p4,1);

figure;
freqz(bp4,ap4);