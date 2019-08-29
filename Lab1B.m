clear;clc



%Part 1, Fa = 2Hz
x=zeros(10,128);
t1=[0:1/128:1-1/128];
z=cos(2*pi*2*t1);
x(1,:)=z;
%%%reshape can help padding zeros between samples
x=reshape(x,1,1280);
figure(1);plot(x,'*')
%Looks like a cos wave


X = fftshift(fft(x));
X_mag = abs(X);
df = -1280/2:1:1280/2 - 1;
%  figure(3);
%  plot(df,X_mag);
  
  
 
  %Part 2
  X_mag2 = X_mag;
  X_mag2(1,65:1217) = 0;
  figure(1);
  plot(fftshift(X_mag2));
  figure(2);
  plot(ifft((X_mag2)));
  
  
  
  
  %Part 3
fb = 2250;
Fs = 5000;
Ts = 1/Fs;

t2 = [0:Ts:1];
y = sin(2*pi*fb*t2);
y(y>0.3) = 0.3;
y(y<-0.3) = -0.3;
figure(2);
plot(t2,y);
  

Y = fftshift(fft(y));
% Y = fft(y);
Y_mag = abs(Y);
df = -Fs/2:1:Fs/2;
figure(3);
plot(df,Y_mag);


Y_mag2 = Y_mag;
Y_mag2(1,1:1950) = 0;
Y_mag2(1,end-1950:end) = 0;
% Y_mag2(1,500:450) = 0
 Y_mag2 = fftshift(Y_mag2);

figure(4);
plot(df,Y_mag2);
 figure(5);
 plot(real(ifft((Y_mag2))));




% Y_mag2 = Y_mag;
% Y_mag2(1,3:2) = 0;
% figure(4)
% plot(ifft((Y_mag2)));  
  
  
%   
%   n = 128
%   df2 = -n/2:1:n/2 - 1;
%   X_mag2 = fftshift(X_mag(1:n));
%   figure(4);
%   plot(df2,X_mag2);
%   
%   figure(5);
%   plot(ifft(fftshift(X_mag2)));
  
  
%   Z = fftshift(fft(z));
%   Z_mag = abs(Z);
%   df = -128/2:1:128/2 - 1;
%   figure(4);
%   plot(df,Z_mag);





  
  
  
  
  
  
  
  
% % Resolution =Fs/N;


%Part 2


