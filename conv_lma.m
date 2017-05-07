%%%%%%%%%%%%% conv_lma.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute 1D-convolution 
% 
% Input Variables:
%      sig      Input sigma for the function
%      range    Range for the width of the array
%       f1      Input image
%       h       GEF table
%       dir     type of convolution(x direction,y or computing absolute)
% 
% Returned Results:
%      f2       Output result
% 
% Processing Flow:
%      1.  Check the type of dir and calculate start and end points for
%      loop. Use the original image for convoultion.
%      2.  Compute product of image pixel and reverse of h array and add it
%      to all iterated pixel.
%      3.  Substitute this value in the center pixel in every iteration.
%      4.  For abs, calculate absolute value for each pixel.
%
% Functions called:
%       None
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


function [ f2 ] = conv_lma( sig,range,f1,h,dir )

ind = sig*range;
ind1 = ind+1;
[r,c]=size(f1);
f2=f1;

if strcmp(dir,'row') == 1
    for i=ind1:r-ind
        for j=1:c
                tmp=0;
            for k = -ind:ind
                c1 = f1(i+k,j)*h((ind1)-k);
                tmp = tmp+c1;
            end
                f2(i,j) = tmp;
        end
    end
end


if strcmp(dir,'col') == 1
    for i=1:r
        for j=ind1:c-ind
                tmp=0;
            for k = -ind:ind
                c1 = f1(i,j+k)*h((ind1)-k);
                tmp = tmp+c1;
            end
                f2(i,j) = tmp;
        end
    end
end

if strcmp(dir,'abs') == 1
    for i=1:r
        for j=1:c
        f2(i,j) = abs(f1(i,j));
        end
    end
end


end

