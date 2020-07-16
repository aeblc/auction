clear 
clc

N = 1000; % set matrix sizes
epsilon = 1/(N+1);
seed = 97;  % set seed to obtain the same random benefits matrix

rng(seed); 
benefits = randi(100,N)  % randomized benefits matrix, rows are people, columns are objects

tic
[assignments, total_benefit] = auction(benefits, epsilon)
time_elapsed = toc