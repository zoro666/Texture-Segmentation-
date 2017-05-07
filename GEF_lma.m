%%%%%%%%%%%%% GEF_lma.m file %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%       To compute gabor filter 
% 
% Input Variables:
%      sig      Input sigma for the function
%      range    Range for the width of the array
%       F       Input F for GEF function
%       theta   Input angle for GEF function
% 
% Returned Results:
%      hx       Output in x direction
%      hy       Output in y direction
%      hrx       Output in x direction real part
%      hry       Output in y direction real part
%      hix       Output in x direction imaginary part
%      hiy       Output in y direction imaginary part
% 
% Processing Flow:
%      1.  Compute the range of x,y,U and V.
%      2.  Compute gx,gy using csGauss function. 
%      3.  Compute GEF using above results.Calculate real and imaginary
%      parts separately or can calculate together
%      4.  If outputs called is 2 then return results of hx and hy only.
%
% Functions called:
%       csGauss.m function to calculate circular gaussian
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

function [ hx,hy,hrx,hix,hry,hiy ] = GEF_lma( F,theta,sig,range )

x  =  -(sig*range):(sig*range);
y  =  -(sig*range):(sig*range);

U  =  F*cosd(theta);
V  =  F*sind(theta);

[ gx,gy ] = csGauss( sig,range );

hx=zeros(size(x));hy=zeros(size(y));
hrx=hx;hix=hx;hry=hy;hiy=hy;

for i=1:length(x)
   hx(i)    =   exp(1i*2*pi*U*x(i))*gx(i);  % real and imaginary part together
   % real and imaginary part calculated separatly
   hrx(i)   =   cos(2*pi*U*x(i))*gx(i);     %real
   hix(i)   =   sin(2*pi*U*x(i))*gx(i);     %imaginary
end

for i=1:length(y)
   hy(i)    =   exp(1i*2*pi*V*y(i))*gy(i); % real and imaginary part together
   % real and imaginary part calculated separatly
   hry(i)   =   cos(2*pi*V*y(i))*gy(i);     %real
   hiy(i)   =   sin(2*pi*V*y(i))*gy(i);     %imaginary
end

if nargout == 2
   hx=hx;
   hy=hy;
end

end

