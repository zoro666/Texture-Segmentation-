clc;clear all;

f=imread('texture2.gif');
[r,c]=size(f);

f1=zeros(size(f));
for x=1:r
    for y=1:c
        if f(x,y)==1
            f1(x,y) = 255;
        end
    end
end

% imshow(f1)

sigm=8;
range=2;
F = 0.059
theta = 135


[ hx,hy ] = GEF_lma( F,theta,sigm,range );

[ I1 ] = conv_lma( sigm,range,f1,hx,'row' );

[ I2 ] = conv_lma( sigm,range,I1,hy,'col' );

[ M ] = conv_lma( sigm,range,I2,hx,'abs' );

sigm2 =24;mf=1;
[ gx,gy ] = csGauss( sigm2,range );
[ M1 ] = conv_lma( sigm2,range,M,gx,'row' );

[ M2 ] = conv_lma( sigm2,range,M1,gy,'col' );

[ M3 ] = adjust_lma( M2,sigm2,range,mf );

th=12;
[ M4 ] = threshold_lma( M2,th );

[ Ir ] = Superimpose_lma( f1,M4 );

ind = mf*sigm2*range;
ind1 = ind+1;
I=Ir(ind1:r-ind,ind1:c-ind);

% % figure
% % mesh(f1)
% % % colormap(jet)    % change color map
% figure
% mesh(M)
% figure
% mesh(M3)
% figure 
% imshow(I)


max3=max(max(M3));
min3=min(min(M3));
u=(max3-min3);
[r1,c1]=size(M3);
P=zeros(size(M3));
for i=1:r1
    for j=1:c1
        P(i,j) = round(255*((M3(i,j)-min3))/u);
    end
end


% % % colormap(jet)    % change color map
