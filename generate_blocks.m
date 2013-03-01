function generate_blocks(directive)

switch directive
    case 'T'
        T_blocks = generate_trials(6,4);
        T_run_num = [1,1,2,2];
        T_block_num = [4,6,2,8];

        for i = 1:length(T_blocks(:,1))

            csvwrite(['./blocks/run_',...
                num2str(T_run_num(i)),...
                '_block_',...
                num2str(T_block_num(i))],...
                    '.csv',...
                    T_blocks(i,:));

        end

        disp('T_blocks:\n');
        for i = 1:4
            disp(num2str(i));
            distribution(i,:) = sum(T_blocks==i,1);
            disp(distribution);
            
        end
        
        if any(any(distribution > 3))

            generate_blocks('T')

        end



        
    case 'R'
        R_blocks = generate_trials(2,10);
        R_run_num = [1,1,1,1,1,2,2,2,2,2];
        R_block_num = [1,3,5,7,9,1,3,5,7,9];

        for i = 1:length(R_blocks(:,1))

            csvwrite(['./blocks/run_',...
                num2str(R_run_num(i)),...
                '_block_',...
                num2str(R_block_num(i))],...
                    '.csv',...
                    R_blocks(i,:));

        end

        disp('R_blocks:\n');
        for i = 1:4
            disp(num2str(i));
            distribution(i,:) = sum(R_blocks==i,1);
            disp(distribution);
        end

        if any(any(distribution > 4))

            generate_blocks('R')

        end

end

end