function fc = relaylayman
%% Initialization
z = fix(rand(10000,1));
x = fix(rand(10000,2));
y = fix(rand(10000,2));
e = fix(rand(10000,2));
I = fix(1+rand(10000,2));
h = fix(100+rand(10000,1));
q = fix(rand(1,2));
pbest = fix(rand(10000,2));
gbest = fix(rand(10000,2));
t=0;
for p=1:10000
    x1 = 0.075+rand(10000,1)*.386;
    x2 = 0.1+rand(10000,1)*.6;
    for ip=1:10000
          if 2.97*x1(ip,1) - 2*x2(ip,1) >=0.5
           
              x(ip,1) = x1(ip,1);
              x(ip,2) = x2(ip,1);
          else
              x1(ip,1) = 0.075+rand(1,1)*.386;
              x2(ip,1) = 0.1+rand(1,1)*.6;
              
          end
          
end
end 

fc = input ('enter the fault current : ' );
psmb=fc/100;
psma=fc/300;
if fc<=3000
    topb = (0.14/((psmb)^0.02-1));
    topa = 2.63;
elseif fc<=4000 && fc>3000
    topa = (0.14/((psma)^0.02-1));
    topb = 2;
else
    fprintf ('invalid input');
    return;
end
a=topa
b=topb


%% parameters of pso
MaxIt = 10;  % number of maximum iterations
nPop = 10000;   % population size
w = 1;       % inertia coefficient 
c1 = 1;      % personal accelaration coefficient  
c2 = 1;      % social accelaration coefficient 
v1 = 0.05*I; % velocity for particle x1
v2 = 0.05*I; % velocity for particle x2

%%problem definition
%objfun =@(x) a*x(ip,1)+b*x(ip,2);
nVar = 2;           % number of unknown variables
Varmin = 0.20;      % lower bound of decision variables 
Varmax = 1.20;      % upper bound of decision variables
%% Main loop of pso
for it = 1:10
    for ip=1:10000
        z(ip,1) = a*x(ip,1)+b*x(ip,2);
        if h(ip,1) > z(ip,1)
        for j=1:2
          
                     pbest(ip,j) = x(ip,j);
        end
                     h(ip,1) = z(ip,1);
                     y(ip,1) = x(ip,1);
                     y(ip,2) = x(ip,2);
        end
    end
    v=min(h);
    for ip=1:10000
            if v==a*y(ip,1)+b*y(ip,2)
                for j=1:2
                    gbest(ip,j)= x(ip,j);
                end
            end
    end
    
    
    for ip=1:10000
        if gbest(ip,1) ~= 0
            k=ip;
        end
    
    end
    
    for ip = 1:10000
        e(ip,1)=x(ip,1);
        e(ip,2)=x(ip,2);
    end
    
    j=fix(1+rand(10000,1));
    for ip=1:10000
          Vit1(ip,1) = w.*v1(ip,1) + c1.*(pbest(ip,1)-x(ip,1)) + c2.*(gbest(k,1).*j(ip,1)-x(ip,1));
          Xit1(ip,1) = x(ip,1)+Vit1(ip,1);
          Vit2(ip,2) = w.*v2(ip,1) + c1.*(pbest(ip,2)-x(ip,2)) + c2.*(gbest(k,2).*j(ip,1)-x(ip,2));
          Xit2(ip,2) = x(ip,2)+Vit2(ip,2);  
    end
    
    for ip=1:10000
        x(ip,1) = Xit1(ip,1);
        x(ip,2) = Xit2(ip,2);
    end
     
    for ip=1:10000
        if ((0.075<x(ip,1) && x(ip,1)<.386) &&( 0.1<x(ip,2) && x(ip,2)<.6) && (2.97*x(ip,1) - 2*x(ip,2) >=0.5))
          x(ip,1) = Xit1(ip,1); 
          x(ip,2) = Xit2(ip,2);
        else 
            
            x(ip,1) = e(ip,1);
            x(ip,2) = e(ip,2);
        end
        
    end
    
    t=t+1;
   
    if t>100000
         for j=1:2
             q(1,j)=gbest(k,j)
                
       end
    end
end

for j=1:2
    Gbest(1,j)=gbest(k,j);
end
%% results500
Gbest()    

% if we don't have gbest then how we will find updated position and velocity
% if we keeping number of iterations same but still we are getting diff ans
