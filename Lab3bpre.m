clear all;
%% Impulse response
n = [1:10];
hd = sin(2*pi*n/5)./(pi*n);
Hn = [flip(hd) 2/5 hd];
figure();
plot([-10:10],Hn);xlim([-10,10]);
title('Impulse Response of FIR filter');
xlabel('lags')
ylabel('magnitude')
%% freqz
N = 21;
Fs = 2500;
[H,W] = freqz(Hn,1,Fs);
H_3db = 20*log10(abs(H));
%plotting
theta = linspace(0,pi,Fs);
f_axis = Fs*theta/(2*pi);
figure();
subplot(211);
plot(f_axis,H_3db);
title('Magnitude');xlim([1,1250]);
subplot(212);
plot(f_axis,W);xlim([1,1250])
title('Phase');
%% magnitude response with fft
number_fft_points = 1000;
Hnf = fftshift(fft(Hn,number_fft_points));
%plotting
theta = linspace(-pi,pi,number_fft_points);
f_axis = Fs*theta/(2*pi);
figure();
plot(f_axis,abs(Hnf));
xlim([f_axis(1),f_axis(end)]);
title('Magnitude response with fft');
