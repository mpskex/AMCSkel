load('data/mocap_abs_xyz.mat');
figure
for i = 1:size(amc_mat_list, 1)
    xlim manual;
    ylim manual;
    zlim manual;
    xlim([-60 60]);
    ylim([-60 60]);
    zlim([-60 60]);
    pause(1/120);
    scatter3(amc_mat_list(i,:,1), amc_mat_list(i,:,3), amc_mat_list(i,:,2));
end