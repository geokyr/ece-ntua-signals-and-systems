%el18153
%ΚΥΡΙΑΚΟΠΟΥΛΟΣ
%ΓΙΩΡΓΟΣ

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%2.1.a
[y1,fs1] = audioread('flute_note.wav');
sound(y1,fs1);

[y2,fs2] = audioread('clarinet_note.wav');
sound(y2,fs2);

[y3,fs3] = audioread('cello_note.wav');
sound(y3,fs3);

%2.1.b
z1 = y1(50000:50999);
figure;
plot(z1);

z2 = y2(40000:40999);
figure;
plot(z2);

z3 = y3(30000:30999);
figure;
plot(z3);

%2.1.c
s1 = abs(fft(y1,fs1));
figure;
plot(s1);

s2 = abs(fft(y2,fs2));
figure;
plot(s2);

s3 = abs(fft(y3,fs3));
figure;
plot(s3);

%2.1.d
l1 = length(y1);
m1 = max(y1);
k1 = y1/abs(m1);
a1 = buffer(k1,1000);
b1 = a1';
e1 = zeros(1,ceil(l1/1000));
for i = 1:ceil(l1/1000)
  e1(i) = conv((k1(i)).^2,(b1(i)).^2);
endfor;
t1 = 0:0.001:((l1-1)/1000);
td1 = 0:floor(l1/1000);
figure;
plot(t1,k1,td1,e1);

l2 = length(y2);
m2 = max(y2);
k2 = y2/abs(m2);
a2 = buffer(k2,1000);
b2 = a2';
e2 = zeros(1,ceil(l2/1000));
for i = 1:ceil(l2/1000)
  e2(i) = conv((k2(i)).^2,(b2(i)).^2);
endfor;
t2 = 0:0.001:((l2-1)/1000);
td2 = 0:floor(l2/1000);
figure;
plot(t2,k2,td2,e2);

l3 = length(y3);
m3 = max(y3);
k3 = y3/abs(m3);
a3 = buffer(k3,1000);
b3 = a3';
e3 = zeros(1,ceil(l3/1000));
for i = 1:ceil(l3/1000)
  e3(i) = conv((k3(i)).^2,(b3(i)).^2);
endfor;
t3 = 0:0.001:((l3-1)/1000);
td3 = 0:floor(l3/1000);
figure;
plot(t3,k3,td3,e3);

%2.1.e
[y4,fs4] = audioread('cello_note_noisy.wav');
s4 = abs(fft(y4,fs4));
sound(y4,fs4);
figure;
plot(s4);

%2.1.st
w = 20;
b = (1/w)*ones(1,w);
a = 1;
f = filter(b,a,y4);
plot(abs(fft(f,fs4)));
sound(f,fs4,16);

%2.1.z
p1 = [2390/(fs3/2) 2410/(fs3/2)];
[b,a] = butter(2,p1);
f1 = filter(b,a,y3);
figure;
plot(abs(fft(f1)));
figure;
plot(f1(20000:20999));

p2 = [1670/(fs3/2) 1690/(fs3/2)];
[b,a] = butter(2,p2);
f2 = filter(b,a,y3);
figure;
plot(abs(fft(f2)));
figure;
plot(f2(20000:20999));

%2.2.a
[y,fs] = audioread('flute_note.wav');
k = y(40000:40833);

%2.2.b
a = fft(k);
s = abs(a);
figure;
plot(s);

for i=1:9
	c(i) = s(10*i+1)/s(11);
end;


%2.2.c
for i=1:9
	f(i) = angle(a(10*i+1));
end;

%2.2.d
t = linspace(0,2,2*fs);
x = 0;
for i=1:9
	x = x + c(i)*cos(2*pi*i*529*t+f(i));
end;

%2.2.e
w = x(40000:40833);
m = max(w);
r = w/abs(m);
figure;
plot(r);
figure;
plot(k);
sound(x/10,fs);
sound(y,fs);

%2.2.st
audiowrite('reconstructed.wav',x/10,fs);