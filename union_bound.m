% File: WeightDistribution.m
% Description: Compute the weight distrubution of a linear code given its
%              generator matrix and the union bound on its performance
%              with BPSK modulation over an AWGN channel.
% Copyright (c) 2006. Robert Morelos-Zaragoza. All rights reserved.

clear all

%n=10;               % Code length
n=8;               % Code length
k=4;                % Code dimension
% Generator matrix, k=4, n=10
% G = [ 1 1 0 1 0 0 0 0 0 0
%       0 0 1 1 0 1 0 0 0 0
%       0 0 0 0 1 1 0 1 0 0
%       0 0 0 0 0 0 1 1 0 1 ];
% G = [ 1 1 0 1 0 0 0 0 
%       0 0 1 1 0 1 0 0 
%       0 0 0 0 1 1 0 1 
%       0 0 0 0 0 0 1 1 ];
G = [ 1 1 0 1 0 0 0 0 
      0 0 1 1 0 1 0 0 
      0 0 0 0 1 1 0 1 
      0 1 0 0 0 0 1 1 ];

% Weight distribution W(C):
W = zeros(1,n+1);
W(1)=1;

% Generate all combinations of message vectors and their weigths
k2=2^k-1;
for i=1:k2
    u = dec2bin(i,k);
    v = mod(u*G,2);
    W(sum(v)+1) = W(sum(v)+1)+1;
end

% Print the weight distribution
fprintf('W(C)={1');
for i=2:n+1
    fprintf(',%d',W(i))
end
fprintf('}\n');

% Compute the union bound
EbNo = 0:0.5:9.5;
EbNoratio = 10.^(EbNo/10);
bound = 0;
for i=1:n
    bound = bound + i*W(i+1)/n * Q(sqrt(2*i*(k/n)*EbNoratio));
end

% semilogy(EbNo,bound,'-o')
semilogy(EbNo,bound,'-s')
axis tight
grid on
xlabel('E_b/N_0 (dB)')
ylabel('P_b')
hold on

% semilogy(EbNo, Q(sqrt(2*EbNoratio)))