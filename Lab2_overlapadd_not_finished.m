clear all;
load ('s.mat');
load ('speech.mat');
sp = speech';
Fs=8000;
NUM = [-0.0625 0.25 0.625 0.25 -0.0625];
DEN = [1 0 0 0 0];
H = NUM;
%%%overlap add
%%
L = 12;
M = length(H);
N = M+L-1;
H = [H,zeros(1,N-length(H))];
H_fs = fft(H);

s_non_divisible_part = L-rem(length(s),L);
s_paddings = zeros(1,s_non_divisible_part);
s= [s, s_paddings];

time_domain_sig=zeros(1,length(s));


for counter = 1:L:length(s)
    stft = fft([s(counter:(counter+L-1)) zeros(1,4)]);
    filtering_in_frequnecy_domain = ifft(H_fs.*stft);
    if counter+N-1>length(s)
       time_domain_sig(counter:end) = filtering_in_frequnecy_domain(1:L);
       break 
    end
    time_domain_sig(counter:counter+N-1) = filtering_in_frequnecy_domain+...
        time_domain_sig(counter:counter+N-1);
end


figure();
subplot 
plot(abs(fftshift(fft(time_domain_sig))));
title('OverlapAdd s');
%%

sp_non_divisible_part = L-rem(length(sp),L);
sp_paddings = zeros(1,sp_non_divisible_part);
sp= [sp, sp_paddings];

time_domain_sig=zeros(1,length(sp));

for counter = 1:L:length(sp)
    stft = fft([sp(counter:(counter+L-1)) zeros(1,4)]);
    filtering_in_frequnecy_domain = ifft(H_fs.*stft);
    if counter+N-1>length(sp)
       time_domain_sig(counter:end) = filtering_in_frequnecy_domain(1:L);
       break 
    end
    time_domain_sig(counter:counter+N-1) = filtering_in_frequnecy_domain+...
        time_domain_sig(counter:counter+N-1);
end


figure();
subplot 
plot(abs(fftshift(fft(time_domain_sig))));
title('OverlapAdd speech');

