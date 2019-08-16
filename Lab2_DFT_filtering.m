clear all;
load ('s.mat');
load ('speech.mat');
sp = speech';
Fs=8000;
NUM = [-0.0625 0.25 0.625 0.25 -0.0625];
DEN = [1 0 0 0 0];
H = NUM;
%  DFT method of filtering, DFT is fast, using 12 point FFT.
%  firstly, pad the impulse of filter and signal of filter to 12 points
H = [H,zeros(1,7)];
num_fft_points = 12;
s_non_divisible_part = num_fft_points-rem(length(s),num_fft_points);
s_paddings = zeros(1,s_non_divisible_part);
s= [s, s_paddings];
H_fs = fft(H);
time_domain_sig=zeros(1,length(s));
for counter = 1:12:length(s)
    stft = fft(s(counter:(counter+11)));
    stft_time = H_fs.*stft;
    time_sig = ifft(stft_time);
    time_domain_sig (counter:counter+11)= time_sig;
end
figure;
%  sound(s,Fs);
%  sound(time_domain_sig,Fs);
%  sound(sp,Fs);
%  sound(sp_filt,Fs);
%subplot 211
plot(abs(fftshift(fft(time_domain_sig))));
title('STFT with no overlap method(distorted s)');


