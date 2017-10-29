function SaveAMCAsMat(out_file, type)
%   Analyzing the mocap dataset
%   Liu Fangrui
%   Beijing University
root_name = './subjects';
subjects = dir(strcat(root_name));
amc_mat_list = [];
if nargin < 2
    type = 'angle';
end

for i = 1 : length(subjects)
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
                if strcmp(type, 'angle')
                    out = channels;
                else strcmp(type, 'xyz')
                    out = Angle2XYZ(channels, skel);
                end
            end
           amc_mat_list = [amc_mat_list; out];
        end
    end
end
save(out_file, 'amc_mat_list', '-v6');