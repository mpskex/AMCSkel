amc_mat_list = load('amc_mat_list.mat', 'amc_mat_list');
amc_mat_list = amc_mat_list.amc_mat_list;

V = [];
for i = 1:size(amc_mat_list, 2)
    V(i) = var(amc_mat_list(:, i)');
end

%   Sampling
randind = randperm(size(amc_mat_list, 1), 24000);
Field = amc_mat_list(randind(1:length(randind)),:);

%   Correlationship
C = ones(size(Field, 2), size(Field, 2));
for i = 1:size(Field, 2)
    C(:,i) = C(:,i) - abs(corr(Field, Field(:,i)));
end
Y = squareform(pdist(C(:, 1:62)));
Z = linkage(Y, 'median');
figure
H = dendrogram(Z, 62);
T = cluster(Z,  'cutoff', 62);
figure
mesh(1:62, 1:62, Y, Y);