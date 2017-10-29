function A = Angle2XYZ(D, skeleton)
    counter = 0;
    A = zeros(size(D, 1), length(skeleton.tree), 3);
    for i = 1:size(D, 1)
        if mod(counter, 100) == 0
            disp(sprintf('%8d is parsed!', counter));
        end
        counter = counter + 1;
        A(i, :, :) = skel2xyz(skeleton, D(i,:));
    end
    disp(sprintf('Total %8d is read!', counter));
end