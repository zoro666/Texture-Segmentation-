clc;clear all;

f=imread('d9d77.gif');
[r,c]=size(f);

f1=zeros(size(f));
for x=1:r
    for y=1:c
        if f(x,y)==1
            f1(x,y) = f(x,y);
        end
    end
end

% imshow(f1)

sigm=36;
range=2;
F = 0.063;
theta = 60;


[ hx,hy ] = GEF_lma( F,theta,sigm,range );

[ I1 ] = conv_lma( sigm,range,f1,hx,'row' );

[ I2 ] = conv_lma( sigm,range,I1,hy,'col' );

[ M ] = conv_lma( sigm,range,I2,hx,'abs' );

% sigm2 =24;mf=1;
% [ gx,gy ] = csGauss( sigm2,range );
% [ M1 ] = conv_lma( sigm2,range,M,gx,'row' );
% 
% [ M2 ] = conv_lma( sigm2,range,M1,gy,'col' );
mf=2;
[ M3 ] = adjust_lma( M,sigm,range,mf );

th=12;
[ M4 ] = threshold_lma( M,th );

[ Ir ] = Superimpose_lma( f1,M4 );

ind = mf*sigm*range;
ind1 = ind+1;
I=Ir(ind1:r-ind,ind1:c-ind);

% % figure
% % mesh(f1)
% % % colormap(jet)    % change color map
figure
mesh(M3)
figure 
imshow(I)

% % % colormap(jet)    % change color map
