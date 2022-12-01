function ir = cART(sg, theta, niter)

step = 1;

angles = 1:step:theta;
[ir, tdiff] = deal(zeros(length(sg)));

for i = 1:niter
    for j = 1:length(angles)
        ir = imrotate(ir, step, 'bicubic', 'crop');
        tmp = sum(repelem(sg(:, j), 1, length(ir)), 2);
        diff = (tmp - sum(ir, 2)) / length(ir);
        for k = 1:length(ir)
            tdiff(:, k) = diff;
        end
        ir = ir + tdiff;
    end
end

end

