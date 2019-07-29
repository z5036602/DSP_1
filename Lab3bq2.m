fs = 8000;
fp = [1500 2000];
theta_p =2*[0 1000 1500 2000 2500 4000]/8000;
m = [ 0 0 1 1 0 0];
b = fir2(22,theta_p,m,rectwin(23));
%freqz(b,1);
[H,W] = freqz(b,1,fs);
H_3db = 20*log10(abs(H));
theta = linspace(0,pi,fs);
f_axis = fs*theta/(2*pi);
figure();
subplot(211);
plot(f_axis,H_3db);
hold on 
plot(1500,-3,'rx');
plot(2000,-3,'rx');
hold off
xlabel('Hz')
ylabel('dB')
title('magnitude response')
subplot(212);
plot(f_axis,W);
hold on 
xlabel('Hz')
ylabel('randians')
title('phase response')