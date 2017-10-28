%   Analyzing the mocap dataset
%   Liu Fangrui
%   Beijing University
root_name = './subjects';
subjects = dir(strcat(root_name));
amc_mat_list = [];

for i = 1 : length(subjects)
    if( isequal( subjects(i).name, '.' )||...
        isequal( subjects(i).name, '..')||...
        ~subjects(i).isdir) 
        continue;
    else
        amc_objs = dir([root_name '/' subjects(i).name '/*.amc' ]);
        sub_list = []
        for j = 1:length(amc_objs)
            if( isequal( amc_objs(j).name, '.DS_Store' )||...
                ~amc_objs(j).isdir) 
                disp([root_name '/' subjects(i).name '/' amc_objs(j).name]);
                D = amc_to_matrix([root_name '/' subjects(i).name '/' amc_objs(j).name]);
           end
        end
        amc_mat_list = [amc_mat_list; D];
    end
end