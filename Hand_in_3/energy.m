function [U] = energy(L,E)

Ldim1 = length(L(:,1));
Ldim2 = length(L(1,:));

tempL  = [L(:,Ldim2),L,L(:,1)];
tempLL = [tempL(Ldim1,:);tempL;tempL(1,:)];


%L(:,length(L(1,:))+1) = L(:,1);
%L(length(L(:,1))+1,:) = L(1,:);
%L() = L(:,1);
%L() = L(1,:);

sum = 0;
for i = 2: Ldim1+1
    
    for j = 2: Ldim2+1
      
        if tempLL(i,j) == 1
            
            sum = sum + tempLL(i-1,j).*tempLL(i,j) + tempLL(i,j).* tempLL(i+1,j) + tempLL(i,j-1).*tempLL(i,j) + tempLL(i,j).* tempLL(i,j+1);
            
        end
        
    end
    
end

U = E.*sum./2;
            
        
        
        

