function generate_blocks_2()

%define unique 4x4 structural elements


element1 = [
    1 2 3 4
    2 1 4 3
    3 4 1 2
    4 3 2 1
];

element2 = [
    2 1 4 3
    3 4 1 2
    4 3 2 1
    1 2 3 4
];

element3 = [
    1 4 3 2
    3 2 1 4
    4 1 2 3
    2 3 4 1
];

element4 = [
    3 2 1 4
    4 1 2 3
    2 3 4 1
    1 4 3 2
];

element5 = [
    4 3 2 1
    2 1 4 3
    1 2 3 4
    3 4 1 2
];

element6 = [
    2 1 4 3
    1 2 3 4
    3 4 1 2
    4 3 2 1
];

T_full_list = [0 0 0 0]';

for i = 1:3
    elements = {element1, element2, element3, element4, element5, element6};


    while (~isempty(elements))

        element_idx = randi(length(elements));
        element_copy = elements{element_idx};

        nums = 1:4;
        remaining_nums = nums;

        for number = 1:length(nums)
            tmp_val = remaining_nums(randi(length(remaining_nums)));
            remaining_nums = remaining_nums(remaining_nums ~= tmp_val);
            element_copy(elements{element_idx} == number) = tmp_val;
        end


        if ~any(T_full_list(:,end) == element_copy(:,1))

            T_full_list = [T_full_list,element_copy];
            elements(element_idx) = [];

        else

            continue

        end



    end
end

R_full_list = zeros(12,25);

for i = 1:3
    elements = {element1, element2, element3, element4, element5, element6};
    R_tmp_list = [0 0 0 0]';

    while (~isempty(elements))

        element_idx = randi(length(elements));
        element_copy = elements{element_idx};

        nums = 1:4;
        remaining_nums = nums;

        for number = 1:length(nums)
            tmp_val = remaining_nums(randi(length(remaining_nums)));
            remaining_nums = remaining_nums(remaining_nums ~= tmp_val);
            element_copy(elements{element_idx} == number) = tmp_val;
        end


        if ~any(R_tmp_list(:,end) == element_copy(:,1))

            R_tmp_list = [R_tmp_list,element_copy];
            elements(element_idx) = [];

        else

            continue

        end
    end
    
    R_full_list((i-1)*4+1:4*i,:) = R_tmp_list;
    
end

T_run_num = [1,1,2,2];
T_block_num = [4,6,2,8];
T_full_list = T_full_list(:,2:end);

for i = 1:length(T_full_list(:,1))

    csvwrite(['./blocks/run_',...
        num2str(T_run_num(i)),...
        '_block_',...
        num2str(T_block_num(i)),...
        '.csv'],...
        T_full_list(i,:));

end

R_run_num = [1,1,1,1,1,2,2,2,2,2];
R_block_num = [1,3,5,7,9,1,3,5,7,9];
R_full_list = R_full_list(1:10,2:end);

for i = 1:length(R_full_list(:,1))

    csvwrite(['./blocks/run_',...
        num2str(R_run_num(i)),...
        '_block_',...
        num2str(R_block_num(i)),...
        '.csv'],...
        R_full_list(i,:));

end


disp('T:');
disp(T_full_list)

disp('R:');
disp(R_full_list)




end