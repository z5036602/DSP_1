%%%this secion is just load the audio data and filter them
clear all;
load ('s.mat');
load ('speech.mat');
sp = speech';
Fs=8000;
NUM = [-0.0625 0.25 0.625 0.25 -0.0625];
DEN = [1 0 0 0 0];
H = NUM;
%% S
% axis
s_len = length(s);
t_s  = 0:1/Fs:((s_len-1)/Fs);
theta_s = linspace(-pi,pi,s_len);
freq_s = theta_s*Fs/(2*pi);                 %%change theta to f
% plot
s_freq = fftshift(fft(s));
figure();
subplot(211);
plot(t_s,s);
title('s time domain signal');
subplot(212)
plot(freq_s,abs(s_freq));
title('s spectrum');
% filter
s_filt = filter(NUM,DEN,s);
% axis
s_filt_len = length(s_filt);
t_s_filt  = 0:1/Fs:((s_filt_len-1)/Fs);
theta_s_filt = linspace(-pi,pi,s_filt_len);
freq_s_filt = theta_s_filt*Fs/(2*pi);
% plot
s_filt_freq = fftshift(fft(s_filt));
figure();
subplot(211);
plot(t_s_filt,s_filt);
title('Filtered s time domain signal');
subplot(212)
plot(freq_s_filt,abs(s_filt_freq));
title('Filtered s spectrum');

%% Speech
% axis
sp_len = length(sp);
t_sp = 0:1/Fs:((sp_len-1)/Fs);
theta_sp = linspace(-pi,pi,sp_len);
freq_sp = theta_sp*Fs/(2*pi);
% plot
sp_freq = fftshift(fft(sp));
figure();
subplot(211);
plot(t_sp,sp);
title('sp time domain signal');
subplot(212)
plot(freq_sp,abs(sp_freq));
title('sp spectrum');
% filter
sp_filt= filter(NUM,DEN,sp);
% axis
sp_filt_len = length(sp_filt);
t_sp_filt  = 0:1/Fs:((sp_filt_len-1)/Fs);
theta_sp_filt = linspace(-pi,pi,sp_filt_len);
freq_sp_filt = theta_sp_filt*Fs/(2*pi);
% plot
sp_filt_freq = fftshift(fft(sp_filt));
figure();
subplot(211);
plot(t_sp_filt,sp_filt);
title('Filtered sp time domain signal');
subplot(212)
plot(freq_sp_filt,abs(sp_filt_freq));
title('Filtered sp spectrum');
H = [H,zeros(1,7)];
%% Sound
%  sound(s,Fs);
%  sound(s_filt,Fs);
%  sound(sp,Fs);
%  sound(sp_filt,Fs);
% DFT method of filtering, DFT is fast

c = 1;
time_domain_sig=[];
H_fs = fft(H);
for counter = 1:11:9900
    stft = fft(s(counter:(counter+11)));
    stft_time = H_fs.*stft;
    time_sig = ifft(stft_time);
    time_domain_sig = [time_domain_sig, time_sig];
end
figure();
subplot 211
plot(abs(fftshift(fft(time_domain_sig))));
title('STFT with no overlap method(distorted s)');
%%
%  sound(time_domain_sig,Fs);
%%

c = 1;
time_domain_sig=[];
new_sp = speech';
for counter = 1:11:5390
    stft = fft(new_sp(counter:(counter+11)));
    stft_time = H_fs.*stft;
    time_sig = ifft(stft_time);
    time_domain_sig = [time_domain_sig, time_sig];
end
subplot 212
plot(abs(fftshift(fft(time_domain_sig))));
title('STFT with no overlap method(distorted speech)');
%%
%  sound(time_domain_sig,Fs);W
%%Q3
c = 1;
time_domain_sig=[];

padded_H_fs = fft([H,zeros(1,4)]);
padded_stft = zeros(1,16);
summing_vec = zeros(1,4);
fda = load('s.mat');
for counter = 1:12:9900
    stft = fft([fda.s(counter:(counter+11)) zeros(1,4)]);
    padded_stft = stft;
    stft_time = padded_H_fs.*padded_stft;
    time_sig = ifft(stft_time);
    if counter~=1
        time_domain_sig(end-3:end) = time_sig(1:4)+time_domain_sig(end-3:end);
        time_domain_sig = [real(time_domain_sig), real(time_sig(5:end))];
    end
    if counter==1
        time_domain_sig = [real(time_domain_sig), real(time_sig)];
    end
end
figure();
subplot 211
plot(abs(fftshift(fft(time_domain_sig))));
title('STFT with no overlap method(distorted s)');
%%
%  sound(time_domain_sig,Fs);W
%%Q3
c = 1;
time_domain_sig=[];

padded_H_fs = fft([H,zeros(1,4)]);
padded_stft = zeros(1,16);
summing_vec = zeros(1,4);
fda = load('s.mat');
for counter = 1:12:9900
    stft = fft([zeros(1,4) fda.s(counter:(counter+11))]);
    padded_stft = stft;
    stft_time = padded_H_fs.*padded_stft;
    time_sig = ifft(stft_time);
    if counter~=1
        time_domain_sig(end-3:end) = time_sig(1:4)+time_domain_sig(end-3:end);
        time_domain_sig = [real(time_domain_sig), real(time_sig(5:end))];
    end
    if counter==1
        time_domain_sig = [real(time_domain_sig), real(time_sig)];
    end
end
figure();
subplot 211
plot(abs(fftshift(fft(time_domain_sig))));
title('STFT with no overlap method(distorted s)');