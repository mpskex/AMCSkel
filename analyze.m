amc_mat_list = load('amc_mat_list.mat', 'amc_mat_list');
amc_mat_list = amc_mat_list.amc_mat_list;

V = [];
for i = 1:size(amc_mat_list, 2)
    V(i) = var(amc_mat_list(:, i)');
end

%   Sampling
randind = randperm(size(amc_mat_list, 1), 7000);
Field = amc_mat_list(randind(1:length(randind)),:);

%   Correlationship
C = ones(size(Field, 2), size(Field, 2));
for i = 1:size(Field, 2)
    C(:,i) = C(:,i) - abs(corr(Field, Field(:,i)));
end
Y = squareform(pdist(C));
Z = linkage(Y, 'complete');
H = dendrogram(Z, 62);
T = cluster(Z,  'cutoff', 62);
%scatter3(Z(:,1), Z(:,2), Z(:,3));