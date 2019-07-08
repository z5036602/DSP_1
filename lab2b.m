%%prelab
clear all;
load ('s.mat');
Fs=8000;
windowSize = 5; 
NUM = (1/windowSize)*ones(1,windowSize);;
DEN =1;;

s_len = length(s);
t_s  = 0:1/Fs:((s_len-1)/Fs);
theta_s = linspace(-pi,pi,s_len);
freq_s = theta_s*Fs/(2*pi);
s_Fs = fftshift(fft(s));
figure();
subplot(211);
plot(t_s,s);
title('time domain signal');
subplot(212)
plot(freq_s,abs(s_Fs));
title('spectrum');
[s_filt,zf] = filter(NUM,DEN,s);
s_filt = [s_filt,zf'];
s_filt_len = length(s_filt);
t_s_filt  = 0:1/Fs:((s_filt_len-1)/Fs);
theta_s_filt = linspace(-pi,pi,s_filt_len);
freq_s_filt = theta_s_filt*Fs/(2*pi);
s_filt_freq = fftshift(fft(s_filt));
figure();
subplot(211);
plot(t_s_filt,s_filt);
title('Filtered time domain signal');
subplot(212)
plot(freq_s_filt,abs(s_filt_freq));
title('Filtered spectrum');
%%

s_Fs = fftshift(fft(s));
new_s_Fs = s_Fs;


