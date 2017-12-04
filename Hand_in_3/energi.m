function [U] = energi(L,E,x,y)

if x-1==0
    up = L(length(L(:,1)),y);
else
    up = L(x-1,y);
end

if x+1 > length(L(:,1))
    down = L(1,y);
else
    down = L(x+1,y);
end

if y-1==0
    left = L(length(L(1,:)),y);
else
    left = L(x,y-1);
end

if y+1 > length(L(:,1))
    right = L(1,y);
else
    right = L(x,y+1);
end


summarum = (up+down+left+right)*L(x,y); 

U = E*summarum;