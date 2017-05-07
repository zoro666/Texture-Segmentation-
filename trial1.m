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


[ hx,hy,hrx,hix,hry,hiy ] = GEF_lma( F,theta,sigm,range );

[r,c] = size(f1);

ind = sigm*range;
ind1 = ind+1;

f1r=f1;f1i=f1;
% l11=length(hrx);

for i=ind1:r-ind
    for j=1:c
        tmp=0;
        tmp1=0;
        for k = -ind:ind
            c = f1(i+k,j)*hrx((ind1)-k);
            c1 = f1(i+k,j)*hix((ind1)-k);
            tmp = tmp+c;
            tmp1= tmp1+c1;
        end
        f1r(i,j) = tmp;
        f1i(i,j) = tmp1;
    end
end

f2r=f1r;f2i=f1i;


for i=1:r
    for j=ind1:c-ind
        tmp=0;
        tmp1=0;
        for k = -ind:ind
            c = f1r(i,j+k)*hy((ind1)-k);
            c1 = f1i(i,j+k)*hy((ind1)-k);
            tmp = tmp+c;
            tmp1= tmp1+c1;
        end
        f2r(i,j) = tmp;
        f2i(i,j) = tmp1;
    end
end

mr = f2r;
mi = f2i;

for i=1:r
    for j=1:c
        mr(i,j) = abs(f2r(i,j));
        mi(i,j) = abs(f2i(i,j));
    end
end


imshow(mr)