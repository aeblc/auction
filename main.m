clear 
clc

N = 100; % set matrix sizes
epsilon = 1/(N+1);
seed = 19;  % set seed to obtain the same random benefits matrix

rng(seed); 
benefits = randi(100,N);  % randomized benefits matrix, rows are people, columns are objects


%% Performance measurements
count = 100;
time_elapsed = zeros(1,count);

for i = 1:count
    N = i;
    benefits = randi(100,N);
    f = @() auction(benefits);
    time_elapsed(i) = timeit(f);
end
