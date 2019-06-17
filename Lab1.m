%%
clear;
Fs = 5000;
f = 1000;
t = [0:1/5000:1];
y = sin(2*pi*1000*t);
figure(1);plot(t,y);
%%
 figure;
q = fft(y);
Y = fftshift(q);
f_axis = [-2500:5000/5000:2500];
plot(f_axis,abs(Y));
%%
figure;

t = [0:1/5000:1];
y_2 = sin(2*pi*2250*t)+0.0;

y_2(y_2>0.3) = 0.3;
y_2(y_2<-0.3) = -0.3;
   
 plot(t,y_2);
  
 q = fft(y_2);
 Y = fftshift(q);
 f_axis = [-2500:5000/5000:2500];
 figure;
 plot(f_axis,abs(Y),'r-');
  