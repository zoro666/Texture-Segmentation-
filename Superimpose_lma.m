%%%%%%%%%%%%% Superimpose_lma.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute superimposed image 
% 
% Input Variables:
%      f1    Original Input Image 
%      M4    processed Image
%
% Returned Results:
%      Ir       Superimposed Output image 
% 
% Processing Flow:
%      1.  Determine the edge of the processed image.
%      2.  Superimpose the edge on the original image.
% 
% Functions called:
%       Edge.m   Function to detect edge by canny edge detection
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
function [ Ir ] = Superimpose_lma( f1,M4 )

Ir=f1;
BW = edge(M4,'Canny');
[r,c] = size(f1); 
for i=1:r
    for j=1:c
        if BW(i,j)==1
            Ir(i,j)=255;
        end
    end
end

end

