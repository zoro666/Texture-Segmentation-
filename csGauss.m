%%%%%%%%%%%%% csGauss.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute circular symmetric gaussian function 
% 
% Input Variables:
%      sig      Input sigma for the function
%      range    Range for the width of the array
% 
% Returned Results:
%      gx       gaussian output in x direction
%      gy       gaussian output in y direction
% 
% Processing Flow:
%      1.  Compute the range of x and y.
%      2.  Compute gx,gy using x and y.  
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

function [ gx,gy ] = csGauss( sig,range )

x  =  -(sig*range):(sig*range);

y  =  -(sig*range):(sig*range);

gx=zeros(size(x));gy=zeros(size(y));

den = (sqrt(2*pi)*sig);

for i=1:length(x)
   gx(i)    =   (exp(-(x(i)^2)/(2*(sig^2))))/den; 
end

for i=1:length(y)
   gy(i)    =   (exp(-(y(i)^2)/(2*(sig^2))))/den; 
end

end

