%%%%%%%%%%%%% adjust_lma.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute adjusted image 
% 
% Input Variables:
%      sig      Input sigma for the function
%      range    Range for the width of the array
%       mf      multiplying factor 
%       I input image
%
% Returned Results:
%      O       output image
% 
% Processing Flow:
%      1.  Compute zero padded image.
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
function [ O ] = adjust_lma( I,sigm,range,mf )

[r,c] = size(I);
ind = mf*sigm*range;
ind1 = ind+1;
O=zeros(size(I));
for i=ind1:r-ind
        for j=ind1:c-ind
            O(i,j) = I(i,j);
        end
end
end

