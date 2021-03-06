function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)


f= dir(fullfile('stack', '*.jpg'));
files = {f.name};
n_images = length(files);
[a, b, c] = size(imread(strcat(focal_stack_dir,'/',files{1})));
rgb_stack = uint8(zeros(a, b, 3*length(files)));
gray_stack = uint8(zeros(a, b, length(files)));
for i = 1:length(files)
    rgb_stack(:, :, 3*(i-1)+1:3*i) = imread(strcat(focal_stack_dir,'/',files{i}));
    gray_stack(:, :, i) = rgb2gray(imread(strcat(focal_stack_dir,'/',files{i})));
end