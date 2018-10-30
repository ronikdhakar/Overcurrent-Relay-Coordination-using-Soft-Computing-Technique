%% start
% fitness function 
% z(i,1)=2.3*x(i,1)+2.3*x(i,2)+2.4*x(i,3); 
%% Initialization
x1 = fix(rand(16,1));
x2 = fix(rand(16,1));
x3 = fix(rand(16,1));
z = fix(rand(16,1));
x = fix(rand(16,3));
for p=1:16
    x1 = 0.087+rand(16,1)*0.435;
    x2 = 0.087+rand(16,1)*0.435;
    x3 = 0.084+rand(16,1)*0.416;
    for ip=1:16
         if (2.67*x2(ip,1)-2.40*x3(ip,1) >=0.25) && (2.91*x1(ip,1) - 2.67*x2(ip,1) >=0.25) && (2.491*x1(ip,1) - 2.30*x2(ip,1) >=0.25)  
           
              x(ip,1) = x1(ip,1);
              x(ip,2) = x2(ip,1);
              x(ip,3) = x3(ip,1);
              
          else
              x1(ip,1) = 0.087+rand(1,1)*.4347;
              x2(ip,1) = 0.087+rand(1,1)*.4347;
              x3(ip,1) = 0.084+rand(1,1)*.416;
              
          end
          
end
end 
%% GA parameters
chromosome_size = 16;
crossover_rate = .33;
mutation_rate = 1;
generation = 10;
%% main function
for i=1:10
    

% cross over
for i=1:16
    z(i,1) = 2.30*x(i,1) + 2.30*x(i,2) + 2.40*x(i,3);
    h(i,1) = z(i,1);
    f(i,1) = x(i,1);
    f(i,2) = x(i,2);
    f(i,3) = x(i,3);
end
for i=1:16
        k1 = fix(1+rand(1,1)*3);
        k2 = fix(1+rand(1,1)*15);
        x(i,k1) = x(k2,k1);
        z(i,1)=2.30*x(i,1)+2.30*x(i,2)+2.40*x(i,3);     
end
for i=1:16
   if h(i,1)<z(i,1)
       x(i,1)=f(i,1);
       x(i,2)=f(i,2);
       x(i,3)=f(i,3);
   end
end  


% Mutation
        for i=1:16
               z(i,1)=2.3*x(i,1)+2.3*x(i,2)+2.4*x(i,3);
               h1(i,1)=z(i,1);
               f1(i,1)=x(i,1);
               f1(i,2)=x(i,2);
               f1(i,3)=x(i,3);
        end

        for i=1:16
        k1 = fix(1+rand(1,1)*15);
        k2 = fix(1+rand(1,1)*15);
        x(i,1)=x(i,1)+rand()*[x(k1,1)-x(k2,1)];% doubt 100 percent mutation rate
        x(i,2)=x(i,2)+rand()*[x(k1,2)-x(k2,2)];
        x(i,3)=x(i,3)+rand()*[x(k1,3)-x(k2,3)];
        end
        
        for j=1:16
            for i=1:16
            if ((2.67*x2(ip,1)-2.40*x3(ip,1) >=0.25) && (2.91*x1(ip,1) - 2.67*x2(ip,1) >=0.25) && (2.491*x1(ip,1) - 2.30*x2(ip,1) >=0.25) && (.087<x(ip,1) && x(ip,1)<.435) && (.087<x(ip,2) && x(ip,2)<.435) && (.084<x(ip,3) && x(ip,3)<0.5))                  
                x(i,1)=x(i,1);
                x(i,2)=x(i,2);
                x(i,3)=x(i,3);
            else
                x(i,1) = 0.087+rand(1,1)*.435;
                x(i,2) = 0.087+rand(1,1)*0.435;
                x(i,3) = 0.083+rand(1,1)*0.5;
                
            end
        end
        end
        for i=1:16
               if h1(i,1)<z(i,1)
                  x(i,1)=f1(i,1);
                  x(i,2)=f1(i,2);
                  x(i,3)=f1(i,3);
               end
        end  
        
end
%% minimum value
          
          o = [0];
          m = [0];
          m1 = [0];
          y=[0 0];
          n=zeros(16,1);
          for i=1:16
          n(i,1)=2.30*x(i,1) + 2.30*x(i,2) + 2.40*x(i,3);    
          end       
          n;
         k=min(n)
         
         for i=1:16
             if k==n(i,1)
                 o=x(i,1);
                 m=x(i,2);
                 m1=x(i,3);
             end
         end
         
       l1=[o m m1]          