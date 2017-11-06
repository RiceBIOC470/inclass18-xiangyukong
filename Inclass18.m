% In class 18

% Problem 1. In this directory, you will find the same image of yeast cells as you used
% in homework 5. First preprocess the image any way you like - smoothing, edge detection, etc. 
% Then, try to find as many of the cells as you can using the
% imfindcircles routine with appropriate parameters. 
% Display the image with the circles drawn on it.  

img = imread('yeast.tif');
edge_yeast = edge(img,'sobel');
imshow(edge_yeast,[])
[centers,radii] = imfindcircles(edge_yeast,[15 35],'Sensitivity',0.93);
figure;imshow(img,[]);hold on;
for ii = 1:length(centers);
  drawcircle(centers(ii,:),radii(ii),'m');
end
% Problem 2. (A) Draw two sets of 10 random numbers - one from the integers
% between 1 and 9 and the second from the integers between 1 and 10. Run a
% ttest to see if these are significantly different. (B) Repeat this a few
% times with different sets of random numbers to see if you get the same
% result. (C) Repeat (A) and (B) but this time use 100 numbers in each set
% and then 1000 numbers in each set. Comment on the results. 

set_1 = randi(9,1,10);
set_2 = randi(10,1,10);
[is_sig, pval] = ttest2(set_1,set_2)


set_a = randi(2000,1,2000);
set_b = randi(7,1,10);
[is_sig, pval] = ttest2(set_a,set_b)

for ii = 1:1000;
    set_1 = randi(9,1,10);
    set_2 = randi(10,1,10);
    [is_sig_12(ii), pval(ii)] = ttest2(set_1,set_2);
end
sum(is_sig_12) = 80

for ii = 1:1000;
    set_a = randi(2000,1,2000);
    set_b = randi(7,1,10);
    [is_sig_ab(ii), pval(ii)] = ttest2(set_a,set_b);
end
sum(is_sig_ab) = 1000

%set_1 and set_2 are within similar range, set_a and set_b are in different
%range and the mean is likely to response correspondantly. When the sample
%size increase, since the set are chosen randomly, there are chances that
%they appear significantly different in the former case, if the sample size
%is even larger, to some point by chance the second group can have a not
%significantly different set as well.