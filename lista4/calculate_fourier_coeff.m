function [A,B,C,theta,f,T]=calculate_fourier_coeff(y) %
%
% Function that calculates the amplitudes of the cos and sin function
% of a Fourier series
% Usage: 
%        [A,B,C,theta,f,T]=calculate_fourier_coeff(y)
%
%          A: coefficients of cos function
%          B: coefficients of sin function
%          C: srqt(A^2 + B^2)
%      theta: phase
%          f: frequencies
%          T: periods
%          y: original data

y=y(:);
N=length(y);

for p=1:1:floor(N/2);
Alpha=0;
Beta =0;
    for n=1:1:N
    Alpha=Alpha+ (2/N)*(y(n)*cos((2*pi*n*p)/N));
    Beta =Beta + (2/N)*(y(n)*sin((2*pi*n*p)/N));
    end
A(p)=Alpha;
B(p)=Beta;

% Determining the respective frequencies and periods.
T(p) = N/p;
f(p)=p/N;
end
Ao=2*mean(y);
A=[Ao A];
B=[0 B];

% Preparing for output 
f=[NaN f];
T=[NaN T];
C=sqrt(A.^2+B.^2);
theta=atan2(B,A);
theta=theta*180/pi;
theta(1)=NaN;






