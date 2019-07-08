% %Step 1
% fa = 1000;
% Fs = 5000;
% Ts = 1/Fs;
% 
% t = 0:Ts:1;
% x = sin(2*pi*fa*t);
% plot(t,x);
% N = length(x);


% %Step 2
% X = fftshift(fft(x));
% X_mag = abs(X);
% df = -Fs/2:1:Fs/2;
% plot(df,X_mag);
% Resolution =Fs/N;


%Step 3
fb = 2250;
Fs = 5000;
Ts = 1/Fs;

t2 = [0:Ts:1];
y = sin(2*pi*fb*t2);
y(y>0.3) = 0.3;
y(y<-0.3) = -0.3;
figure(1);
plot(t2,y);



Y = fftshift(fft(y));
Y_mag = abs(Y);
df = -Fs/2:1:Fs/2;
figure(2);
plot(df,Y_mag);



