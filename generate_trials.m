function outlist = generate_trials(repeats,amount)

numbers = 1:4;

total_permutations = perms(numbers);

list = zeros(1,12);

for i = numbers
    
    end_in_i = total_permutations(total_permutations(:,end) == i,:);
    
    remaining = numbers(numbers~=i);
    
    for j = remaining
        
        for k = 1:length(end_in_i(:,1))
            
            start_with_j = total_permutations(total_permutations(:,1) == j,:);
            
            remaining_2 = remaining(remaining ~= k);
            
            for l = remaining_2
                
                for m = 1:length(start_with_j(:,1))
                    
                
                    start_with_l = total_permutations(total_permutations(:,1) == l,:);


                    for n = 1:length(start_with_l(:,1))

                        list(length(list(:,1))+1,:) = [end_in_i(k,:),start_with_j(m,:),start_with_l(n,:)];

                    end
                    
                end
                
            end
            
        end
        
    end
    
end

list = [list,zeros(length(list(:,1)),1)];
list = list(2:end,:);

outlist = zeros(amount,repeats*12);

items = length(list(:,1));    

for i = 1:amount
    
    tmprow = list(randi(items),1:end-1);
    
    for j = 1:repeats-1  
        
        while 1
        
            remaining_list = list(list(:,end) ~= 1,:);
            remaining_items = length(remaining_list(:,1));
            idx = randi(remaining_items);
            try_row = remaining_list(idx,1:end-1);
            
            if tmprow(end)~=try_row(1)
            
                tmprow = [tmprow,try_row];
                list(idx,end) = 1;
                
                break
            
            end
            
        end
        
    end
    
    outlist(i,:)=tmprow;

end


end