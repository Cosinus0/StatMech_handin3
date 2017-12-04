T = linspace(2,0.05,100);

dimA1 = 50;     
dimA2 = 50;


equi = 50;
iat = 100;
A=1;
B=2;

kb = 1;
E = -1*kb;
N = 1250;
Na=N/2;
Nb=N/2;





LA = genpopmix(dimA1,dimA2,Na,A,Nb,B);


EA = [];
EA2 = [];



for iT = 1:length(T)
    T(iT)

        

    for iitS = 1:(iat+equi) 
    
       
    %if mod(iitS,10) == 0
    %figure(1)
    %imshow((LA)/(B/A),'InitialMagnification','fit')
    %set(gca,'xticklabel',{[]})
    %set(gca,'yticklabel',{[]})
    %delete(findall(findall(gcf,'Type','axe'),'Type','text'))
    
    %drawnow
    %end
        
    
    for ittN = 1:((dimA1*dimA2))
        

        

                
               
               dim11rand = randperm(length(LA(:,1)),1);
               dim12rand = randperm(length(LA(1,:)),1);

               tempsite1 = LA(dim11rand,dim12rand);

        

                
        
               dim21rand = randperm(length(LA(:,1)),1);
               dim22rand = randperm(length(LA(1,:)),1);

               tempsite2 = LA(dim21rand,dim22rand);
               

               

               

                
                Uorg=energi(LA,E,dim11rand,dim12rand,tempsite1)+energi(LA,E,dim21rand,dim22rand,tempsite2);
                Utri=energi(LA,E,dim11rand,dim12rand,tempsite2)+energi(LA,E,dim21rand,dim22rand,tempsite1);
                
                deltaU = Utri-Uorg;
            
            if deltaU < 0
                
               LA(dim11rand,dim12rand)=tempsite2;
               LA(dim21rand,dim22rand)=tempsite1;
               
            else
                r = rand(1,1);
                    if r < exp(-deltaU.*(1./(kb.*T(iT))))
                        
                        LA(dim11rand,dim12rand)=tempsite2;
                        LA(dim21rand,dim22rand)=tempsite1;
                        
                    end
            end
            
            



            

            
            
    end

    if iitS > equi
        EnA = energy(LA,E);
        EA2(iitS-equi) = EnA^2;
        EA(iitS-equi) = EnA;
    end
    
end
deltaEA = mean(EA2)-mean(EA)^2;
CvA(iT) = deltaEA/(kb*T(iT)^2);
En(iT) = mean(EnA);
clear EA
clear EA2
end
S=entropi(CvA,T,Na,Nb,dimA1,dimA2,kb);
leasqrfunc = @(p, x) p(1) + p(2)./(1+exp(-p(3)*(x-p(4)))); % p = (E0, L, k, T0)
x0=[En(1), En(length(En))-En(1), 1, 1];
p = lsqcurvefit(leasqrfunc,x0,T,En);
E_fit = leasqrfunc(p,T);
F = E_fit-T.*S;



