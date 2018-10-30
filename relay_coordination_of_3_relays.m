%% Initialization
z = fix(rand(100,1));
x = fix(rand(100,3));
e = fix(rand(100,3));
I = fix(1+rand(100,1));
h = 100.*I;
pbest = fix(rand(100,3));
gbest = fix(rand(100,3));
a=0;
for p=1:1000
    for ip=1:100
    x1 = 0.087+rand(100,1)*.4347;
    x2 = 0.087+rand(100,1)*.4347;
    x3 = 0.084+rand(100,1)*.416;
    
    
          if (2.67*x2(ip,1)-2.40*x3(ip,1) >=0.25) && (2.91*x1(ip,1) - 2.67*x2(ip,1) >=0.25) && (2.491*x1(ip,1) - 2.30*x2(ip,1) >=0.25)  
           
              x(ip,1) = x1(ip,1);
              x(ip,2) = x2(ip,1);
              x(ip,3) = x3(ip,1);
              
          else
              x1 = 0.087+rand(1,1)*.4347;
              x2 = 0.087+rand(1,1)*.4347;
              x3 = 0.084+rand(1,1)*.416;
              
          end
          
end
end
%% parameters of pso
MaxIt = 1000;  % number of maximum iterations
nPop = 100;   % population size
w = 1;       % inertia coefficient 
c1 = 1;      % personal accelaration coefficient  
c2 = 1;      % social accelaration coefficient
c3 = 1;      % social accelaration coefficient
v1 = 0.05*I; % velocity for particle x1
v2 = 0.05*I; % velocity for particle x2
v3 = 0.05*I; % velocity for particle x3
%%problem definition
%objfun =@(x) 2.30*x(ip,1) + 2.30*x(ip,2) + 2.40*x(ip,3);
nVar = 2;           % number of unknown variables
Varmin = 0.20;      % lower bound of decision variables 
Varmax = 1.20;      % upper bound of decision variables
%% Main loop of pso
for it = 1:1000
    for ip=1:100
        z(ip,1) = 2.30*x(ip,1) + 2.30*x(ip,2) + 2.40*x(ip,3);
        if h(ip,1) > z(ip,1)
        for j=3
          
                     pbest(ip,j) = x(ip,j);
        end
                     h(ip,1) = z(ip,1);    
        end
    end
    v=min(z);
    for ip=1:100
            if v == 2.30*x(ip,1) + 2.30*x(ip,2) + 2.40*x(ip,3)
                for j=1:3
                    gbest(ip,j)=x(ip,j);
                end
            end
    end
    for ip=1:100
        if gbest(ip,1) ~= 0
            k=ip;
        end
    
    end
    
    for ip = 1:100
        e(ip,1)=x(ip,1);
        e(ip,2)=x(ip,2);
        e(ip,3)=x(ip,3);
    end
    
    j=fix(1+rand(100,1));
    for ip=1:100
          Vit1(ip,1) = w.*v1(ip,1) + c1.*(pbest(ip,1)-x(ip,1)) + c2.*(gbest(k,1).*j(ip,1)-x(ip,1));
          Xit1(ip,1) = x(ip,1)+Vit1(ip,1);
          Vit2(ip,2) = w.*v2(ip,1) + c1.*(pbest(ip,2)-x(ip,2)) + c2.*(gbest(k,2).*j(ip,1)-x(ip,2));
          Xit2(ip,2) = x(ip,2)+Vit2(ip,2);
          Vit3(ip,3) = w.*v3(ip,1) + c1.*(pbest(ip,3)-x(ip,3)) + c2.*(gbest(k,3).*j(ip,1)-x(ip,3));
          Xit3(ip,3) = x(ip,3)+Vit3(ip,3);
    end
    
    for ip=1:100  
          x(ip,1) = Xit1(ip,1); 
          x(ip,2) = Xit2(ip,2);
          x(ip,3) = Xit3(ip,3);
    end
    
    for ip=1:100
        if ((0.087<x(ip,1) && x(ip,1)<.4347) && (0.087<x(ip,2) && x(ip,2)<.4347) && (0.084<x(ip,3) && x(ip,3)<.416) && (2.67*x(ip,2)-2.40*x(ip,3) >=0.25) && (2.91*x(ip,1) - 2.67*x(ip,2) >=0.25) && (2.491*x(ip,1) - 2.30*x(ip,2) >=0.25) )
          x(ip,1) = Xit1(ip,1); 
          x(ip,2) = Xit2(ip,2);
          x(ip,3) = Xit2(ip,3);
        else 
            
            x(ip,1) = e(ip,1);
            x(ip,2) = e(ip,2);
            x(ip,3) = e(ip,3);
        end
        
    end
    
end

for j=1:3
    Gbest(1,j)=gbest(k,j);
end
%% results

Gbest
