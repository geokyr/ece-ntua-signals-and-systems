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