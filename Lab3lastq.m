n = [1:11];

hd = 1/pi*(-sin((3*pi/8)*n)./(n)+(sin((1*pi/2)*n)./(n)));


Hn = [flip(hd) 0.125 hd];
freqz(Hn,1,8000);
% plot([-11:11],Hn);xlim([-11,11]);
% title('Impulse Response of FIR filter');
% xlabel('lags')
% ylabel('magnitude')