function [y,Y]=calculate_fourier_series2(A,B,f,N)
%
% Function that uses the Fourier coefficients to estimate 
% the original Fourier time series and Partial Fourier Series (with less components)

% Usage: 
%        [y,Y]=calculate_fourier_serie(A,B,N);
%
%          A: coefficients of cosine function
%          B: coefficients of sine function
%          f: frequencies of the sine and cosine
%          N: number of points to estimate A and B
%
%          y: single components
%          Y: complete serie
%
A=A(:);
B=B(:);
Ao=A(1);
f=f(:);

Na=length(A);
Nb=length(B);
    if Na~=Nb
    error('A and B must be the same size');
    end
y=zeros(Na,N); %
i=1:1:N;
    for p=1:Na
    y(p,:)=y(p,:)+A(p)*cos(2*pi*f(p)*i)+B(p)*sin(2*pi*f(p)*i);
    end   
Y=0.5*Ao+sum(y,1);
