clc;clear all;

f=imread('texture1.gif');
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

[r,c] = size(f1);

ind = sigm*range;
ind1 = ind+1;

f11=f1;
% l11=length(hrx);

for i=ind1:r-ind
    for j=1:c
        tmp=0;
        
        for k = -ind:ind
            c = f1(i+k,j)*hx((ind1)-k);
            
            tmp = tmp+c;
            
        end
        f11(i,j) = tmp;
        
    end
end

f2=f11;


for i=1:r
    for j=ind1:c-ind
        tmp=0;
        
        for k = -ind:ind
            c = f1r(i,j+k)*hy((ind1)-k);
            
            tmp = tmp+c;
            
        end
        f2(i,j) = tmp;
        
    end
end

m = f2;


for i=1:r
    for j=1:c
        m(i,j) = abs(f2(i,j));
       
    end
end



m1=m;
[r1,c1]=size(m);

for i=1:r1
    for j=1:c1
        if m(i,j) > 150
            m1(i,j) = m(i,j);
        else
            m1(i,j)  = 0;
        end
    end
end

x1=1:x;
y1=1:y;

figure
imshow(m)
figure
imshow(m1)
figure
imshow(f1)


figure
plot3(x1,y1,m1)