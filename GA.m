function fc = GA
%% start
% fitness function 
% z(i,1)=2.63*x(i,1)+2*x(i,2); 
%% Initialization
k1 = fix(rand(1,1));
k2 = fix(rand(1,1));
x1 = fix(rand(1,1));
x2 = fix(rand(1,1));
z = fix(rand(256,1));
x = fix(rand(256,2));
e = fix(rand(256,2));
f = fix(rand(256,2));
f1 = fix(rand(256,2));
I = fix(1+rand(256,1));
h = 100.*I;
h1 = 100.*I;
l = 100.*I;
for p=1:256
    x1 = 0.075+rand(256,1)*.386;
    x2 = 0.1+rand(256,1)*0.5;
    for ip=1:256
          if 2.97*x1(ip,1) - 2*x2(ip,1) >=0.5
           
              x(ip,1) = x1(ip,1);
              x(ip,2) = x2(ip,1);
          else
              x1(ip,1) = 0.075+rand(1,1)*.386;
              x2(ip,1) = 0.1+rand(1,1)*.5;
              
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

%% GA parameters
chromosome_size = 256;
crossover_rate = .5;
mutation_rate = 1;
generation = 10;
%% main function
for i=1:10
    

% cross over
for i=1:256
    z(i,1) = a*x(i,1) + b*x(i,2);
    h(i,1) = z(i,1);
    f(i,1) = x(i,1);
    f(i,2) = x(i,2);
end

for i=1:256
       
        k1 = fix(1+rand(1,1)*2);
        k2 = fix(1+rand(1,1)*255);
        x(i,k1) = x(k2,k1);
        z(i,1)=2.63*x(i,1)+2*x(i,2);     
end
for i=1:256
   if h(i,1)<z(i,1)
       x(i,1)=f(i,1);
       x(i,2)=f(i,2);
   end
end  
    
    
% Mutation
        for i=1:256
               z(i,1)=2.63*x(i,1)+2*x(i,2);
               h1(i,1)=z(i,1);
               f1(i,1)=x(i,1);
               f1(i,2)=x(i,2);
        end

        for i=1:256
        k1 = fix(1+rand(1,1)*255);
        k2 = fix(1+rand(1,1)*255);
        x(i,1)=x(i,1)+rand()*[x(k1,1)-x(k2,1)];% doubt 100 percent mutation rate
        x(i,2)=x(i,2)+rand()*[x(k1,2)-x(k2,2)];
        end
        
        for j=1:256
            for i=1:256
            if ((0.075<x(i,1)&&x(i,1)<.386) &&( 0.1<x(i,2)&&x(i,2)<.5) && (2.97*x(i,1) - 2*x(i,2) >=0.5))
                x(i,1)=x(i,1);
                x(i,2)=x(i,2);
            else
                x(i,1) = 0.075+rand(1,1)*.386;
                x(i,2) = 0.1+rand(1,1)*0.5;
                
            end
        end
        end
        for i=1:256
               if h(i,1)<z(i,1)
                  x(i,1)=f1(i,1);
                  x(i,2)=f1(i,2);
               end
        end  
        
end
%% minimum value
          
          o = [0];
          m = [0];
          y=[0 0];
          n=zeros(256,1);
          for i=1:256
          n(i,1)=2.63*x(i,1)+2*x(i,2);    
          end       
          n;
         k=min(n)
         
         for i=1:256
             if k==n(i,1)
                 o=x(i,1);
                 m=x(i,2);
             end
         end
         
       x=[o m]          

        
        
        