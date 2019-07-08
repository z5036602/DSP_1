function [ Xn ] = dft( xn, N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=128;
k=0:N:N-1;
n=0:1:N-1;
for u=0:1:N
    Xn=xn*exp((-1j*2*pi*k*n)/N)+temp;
    
end

