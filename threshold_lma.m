%%%%%%%%%%%%% threshold_lma.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute thresholded image 
% 
% Input Variables:
%      th    Input Threshold 
%       I    Input image
%
% Returned Results:
%      O       Output image
% 
% Processing Flow:
%      1.  Compute turn on the pixel of output image if the value of input 
%       image is above threshold else turn it off.
%
%  Restrictions/Notes:
%     None
%
%  The following functions are called:
%      None
%      
%  Author:      Mandar Parab, Amogh Adishesha and Lyuzhou Zhuang
%  Date:        04/09/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ O ] = threshold_lma( I,th )
O = zeros(size(I));
[r,c] = size(I);
for i=1:r
        for j=1:c
            if I(i,j) > th
            O(i,j) = 255;
            end
        end
end


end

