function [assignments, total_benefit] = auction(benefits, epsilon)

N = length(benefits);
benefits_test = benefits;

people = [linspace(1,N,N); zeros(1,N)]; % first row people, second row indicates if they're satisfied or not
object_prices = zeros(1,N); % prices of the objects
options = zeros(1,N); % prices - benefits, this will determine the net benfit of an assignment
assignments = [linspace(1,N,N); linspace(1,N,N)]; % first row people, second row objects

if(nargin < 2)
    epsilon = 1 / (N+1);
end


while sum(people(2,:)) < N
    for i = 1:N
        if(people(2,i) == 0)
            options = benefits(i,:) - object_prices(1,:);
            [best_option, index] = max(options);
            
            if(best_option > 0)
                j = 1;
                while (index ~= assignments(2,j))
                    j = j+1;
                end
                
                temp = assignments(2,j);
                assignments(2,j) = assignments(2,i);
                assignments(2,i) = temp;
                
                options(index) = -1;
                next_best_option = max(options);
                
                if(next_best_option > 0)
                    bid = best_option - next_best_option;
                else
                    bid = best_option;
                end
                
                
                object_prices(index) = object_prices(index) + bid + epsilon;
                
            else
                people(2,i) = 1;
                benefits(:,assignments(2,i)) = zeros(1,N);
            end
            
        end
    end
end

total_benefit = 0;

for i = 1:N
    j = assignments(2,i);
    total_benefit = total_benefit + benefits_test(i,j);
end
end