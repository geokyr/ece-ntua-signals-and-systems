% el18153
% ΚΥΡΙΑΚΟΠΟΥΛΟΣ
% ΓΕΩΡΓΙΟΣ

%1.1.a
b1 = ones(3,1)/3;
a1 = 1;

b2 = ones(5,1)/5;
a2 = 1;

b3 = ones(11,1)/11;
a3 = 1;

%1.1.b
figure;
freqz(b1,a1);

figure;
freqz(b2,a2);

figure;
freqz(b3,a3);

%1.1.c
[z1,p1,k1] = tf2zp(b1,a1);
figure;
zplane(z1,p1);

[z2,p2,k2] = tf2zp(b2,a2);
figure;
zplane(z2,p2);

[z3,p3,k3] = tf2zp(b3,a3);
figure;
zplane(z3,p3);