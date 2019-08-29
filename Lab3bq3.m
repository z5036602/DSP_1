fs = 8000;
fp = [1500 2000];
f = 2*[0 1000 1500 2000 2500 4000]/8000;
a = [0 0 1 1 0 0];
%order = 10:20;
%b = firpm(order,f,a);
theta = linspace(0,pi,fs);
f_axis = fs*theta/(2*pi);
for order = 23:23
    b = firpm(order,f,a);    
    [h,w] = freqz(b,1,fs);
    hold on 
    plot(w/pi,20*log10(abs(h)));
    legend('order');
end 
plot(1500,-1,'rx');
plot(2000,-1,'rx');
plot(f_axis,1*ones(1,8000));
plot(f_axis,-1*ones(1,8000));
plot(f_axis,-30*ones(1,8000));
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude';