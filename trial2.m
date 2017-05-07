clc;clear all;


sig=8;



F = 0.059;
theta = 135;

U=F*cosd(theta);
V=F*sind(theta);

range=2;

x=-(sig*range):(sig*range);
y=-(sig*range):(sig*range);

% gx=zeros(size(x));gy=zeros(size(y));
% for i=1:length(x)
%    gx(i)=exp(-(x(i)^2)/(2*(sig^2)))/(sqrt(2*pi)*sig); 
% end
% for i=1:length(y)
%    gy(i)=exp(-(y(i)^2)/(2*(sig^2)))/(sqrt(2*pi)*sig); 
% end

[ gx,gy ] = csGauss( sig,range );

% hx=zeros(size(x));hy=zeros(size(y));
% 
% for i=1:length(x)
%    hx(i)=exp(1i*2*pi*U*x(i))*gx(i); 
% end
% 
% for i=1:length(y)
%    hy(i)=exp(1i*2*pi*V*y(i))*gy(i); 
% end

[ hx,hy ] = GEF_lma( F,theta,sig,range );


