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