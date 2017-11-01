%   Analyzing the mocap dataset
%   Liu Fangrui
%   Beijing University
root_name = './subjects';
subjects = dir(strcat(root_name));
amc_mat_list = [];
out_file = 'out.mat'

parfor i = 1 : length(subjects)
    if( isequal( subjects(i).name, '.' )||...
        isequal( subjects(i).name, '..')||...
        ~subjects(i).isdir) 
        continue;
    else
        amc_objs = dir([root_name '/' subjects(i).name '/*.amc' ]);
        asf_objs = dir([root_name '/' subjects(i).name '/*.asf' ]);
        skel = acclaimReadSkel([root_name '/' subjects(i).name '/' asf_objs(1).name ]);
        for j = 1:length(amc_objs)
            if( isequal( amc_objs(j).name, '.DS_Store' )||...
                ~amc_objs(j).isdir) 
                disp([root_name '/' subjects(i).name '/' amc_objs(j).name]);
                %   Read the Raw Angle Data
                [channels, skel] = acclaimLoadChannels(...
                                        [root_name '/' subjects(i).name '/' amc_objs(j).name],...
                                        skel);
                disp('Converting to XYZ...');
                %   Convert to XYZ Data
                % out = channels;
                out = Angle2XYZ(channels, skel);
            end
            amc_mat_list = [amc_mat_list; 1];
        end
    end
end
save(out_file, 'amc_mat_list', '-v6');