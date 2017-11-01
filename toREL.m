%   Convert absolute xyz position
%   to relative xyz position (simply pose oriented)
%load('data/mocap_abs_xyz.mat');
mocap_rel_xyz = zeros(size(mocap_abs_xyz, 1), size(mocap_abs_xyz, 2), size(mocap_abs_xyz, 3));
for i = 1:size(mocap_abs_xyz, 1)
    for j = 2:size(mocap_abs_xyz, 2)
        for k = 1:size(mocap_abs_xyz, 3)
            mocap_rel_xyz(i,j,k) = mocap_abs_xyz(i,j,k) - mocap_abs_xyz(i,1,k);
        end
    end
end
save('data/mocap_rel_xyz.mat', 'mocap_rel_xyz', '-v7.3');