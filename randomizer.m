function randomizer(choice,interArrivalTime,serviceTime,x)  
    
 
    if (choice == 1)
 
        vt1 = [0.3 0.1 0.2 0.25 0.15];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        rnd1 = round(vt1*100)/100;
        rands = round(rnd1*100);
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        %Inter Arrival Time Range
        
        for i = 1:length(interArrivalTime)
            if((interArrivalTime(i) >= firstrand(1)) &&  (interArrivalTime(i) <= cdfrands(1)))
                IaT(i+1) = 1 ;
            end
            if((interArrivalTime(i) >= firstrand(2)) &&  (interArrivalTime(i) <= cdfrands(2)))
                IaT(i+1) = 2 ;
            end
            if((interArrivalTime(i) >= firstrand(3)) &&  (interArrivalTime(i) <= cdfrands(3)))
                IaT(i+1) = 3 ;
            end
            if((interArrivalTime(i) >= firstrand(4)) &&  (interArrivalTime(i) <= cdfrands(4)))
                IaT(i+1) = 4 ;
            end
            if((interArrivalTime(i) >= firstrand(5)) &&  (interArrivalTime(i) <= cdfrands(5)))
                IaT(i+1) = 5 ;
            end
        end
            
      
        
        
        %  Arrival Time    
        ArrivalTime(1)= 0;
        for i = 1:length(interArrivalTime)
            ArrivalTime(i+1) = ArrivalTime(i)+ IaT(i+1);
        end
        
        
        
        
        
        
        %SERVICE TIME 
        
        
        
        
        vt1 = [0.1 0.5 0.1 0.05 0.25];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        %    service time range 
        
        for i = 1:x
            if((serviceTime(i) >= firstrand(1)) &&  (serviceTime(i) <= cdfrands(1)))
                st(i) = 2 ;
            end
            if((serviceTime(i) >= firstrand(2)) &&  (serviceTime(i) <= cdfrands(2)))
                st(i) = 3 ;
            end
            if((serviceTime(i) >= firstrand(3)) &&  (serviceTime(i) <= cdfrands(3)))
                st(i) = 4 ;
            end
            if((serviceTime(i) >= firstrand(4)) &&  (serviceTime(i) <= cdfrands(4)))
                st(i) = 5 ;
            end
            if((serviceTime(i) >= firstrand(5)) &&  (serviceTime(i) <= cdfrands(5)))
                st(i) = 6 ;
            end
            
        end
        
        

        
        %       SERVICE TIME for Counter 2 
        
        serviceTime2 = serviceTime;
        
        vt1 = [0.32 0.3 0.2 0.04 0.14];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        
        for i = 1:x
            if((serviceTime2(i) >= firstrand(1)) &&  (serviceTime2(i) <= cdfrands(1)))
                st2(i) = 3 ;
            end
            if((serviceTime2(i) >= firstrand(2)) &&  (serviceTime2(i) <= cdfrands(2)))
                st2(i) = 4 ;
            end
            if((serviceTime2(i) >= firstrand(3)) &&  (serviceTime2(i) <= cdfrands(3)))
                st2(i) = 5 ;
            end
            if((serviceTime2(i) >= firstrand(4)) &&  (serviceTime2(i) <= cdfrands(4)))
                st2(i) = 6 ;
            end
            if((serviceTime2(i) >= firstrand(5)) &&  (serviceTime2(i) <= cdfrands(5)))
                st2(i) = 7 ;
            end
            
        end  
        
        

        
        
        %Time Service Ends = Service Time Counter 1
        tse(1) =  st(1);
        
        
        %   Intializing values for Time Service Begins & Ends
        for i = 1:length(interArrivalTime)
            if (tse(i) >  ArrivalTime(i+1))
                tsb(i+1) = tse(i);
                
            else
                tsb(i+1) = ArrivalTime(i+1);
            end
            tse(i+1)= tsb(i+1) + st(i+1); 
            
        end
        

        
        printf('\n\n\n %69s %50s \n', '-------------|Counter 1|-------------','-------------|Counter 2|-------------')  
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n', 'Customer No.','RN ServiceTime',' ServiceTime  ','Time Service','Time Service', 'ServiceTime  ', 'Time Service', 'Time Service',' Waiting ',' Time ');
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n\n', '            ', '            ','             ','   Begins   ','   Ends     ', '             ', '   Begins   ', '     Ends   ','  Time   ',' spent');
        
        printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s                %0.f                %0.f\n',1  ... 
        ,serviceTime(1),st(1),tsb(1),tse(1),' ',' ',' ',0,tse(1)-ArrivalTime(1))
        
        %    Compares the Arrival time and Time service ends 
        %             TSE > AT = Counter 2
        %             TSE < AT = Counter 1
        
        %    WT = Waiting Time
        sums=st(1);
        sums2 = 0;
        for i = 1:length(interArrivalTime)
            if(tse(i) > ArrivalTime(i+1))
                tsb2(i) = ArrivalTime(i+1);
                tse2(i) = tsb2(i) + st2(i+1);
                WT(i) = tsb2(i) - ArrivalTime(i+1);
                timeSpent(i) = tse2(i) - ArrivalTime(i+1);
                
                printf('\n       %0.f            %0.f        %15s     %10s   %10s           %0.f              %0.f               %0.f            %0.f                %0.f \n',i+1  ... 
                ,serviceTime2(i+1),' ',' ',' ',st2(i+1),tsb2(i),tse2(i),WT(i),timeSpent(i))
                
                
                tse(i+1) = tse(i);
                sums2= sums2 + st2(i+1);
                
            else
                tsb(i) = ArrivalTime(i+1);
                tse(i) = tsb(i)+st(i+1);
                WT2(i) = tsb(i) - ArrivalTime(i+1);
                timeSpent(i) = tse(i) - ArrivalTime(i+1);
                
                
                printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s             %0.f                %0.f\n',i+1  ... 
                ,serviceTime(i+1),st(i+1),tsb(i),tse(i),' ',' ',' ',WT2(i),timeSpent(i))
                tse(i+1) = tse(i);
                
                sums= sums + st(i+1);
            end
        end
        

        
        % Average Waiting Time
        
        TotalWaitingTime = 0;
        
        for i = 1:length(interArrivalTime)
            TotalWaitingTime = TotalWaitingTime + WT(i);
            
        end
        
        AvgWaitingTime = TotalWaitingTime/length(serviceTime);
        
        printf('\n\nThe Average Waiting Time: %0.f ', AvgWaitingTime) 
        
        
        
        % Average Time Spent
        
        TotalTimeSpent = 0;
        
        for s = 1:length(interArrivalTime)
            TotalTimeSpent = TotalTimeSpent + timeSpent(s);
        end
        
        AvgTimeSpent = TotalTimeSpent/length(serviceTime);
        
        printf('\n\nThe Average Time Spent: %0.f ', AvgTimeSpent)
        
        
        
        % The probability that a customer has to wait
        
        count = 0;
        
        for m = 1:length(interArrivalTime)
            if (WT(m) > 0)
                count = count + 1;
            end
        end          	  
        
        probability = count/length(serviceTime);
        
        printf('\n\nThe probability that a customer has to wait: %0.f  \n', probability)
        
        
        
        % Average service time for each counter
        
        % counter 1
        
        AvgServiceTime = sums/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 1: %0.1f \n', AvgServiceTime)
        
        
        % counter 2
        
        AvgServiceTime2 = sums2/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 2: %0.1f ', AvgServiceTime2)   
        
        disp(' ')
        
        
        
        
        
        
        
        
        
        %  *************************choice 2
        
        
        
    elseif (choice ==2)
 
        vt1 = [0.3 0.1 0.2 0.25 0.15];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        rnd1 = round(vt1*100)/100;
        rands = round(rnd1*100);
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        %Inter Arrival Time Range
        
        for i = 1:length(interArrivalTime)
            if((interArrivalTime(i) >= firstrand(1)) &&  (interArrivalTime(i) <= cdfrands(1)))
                IaT(i+1) = 1 ;
            end
            if((interArrivalTime(i) >= firstrand(2)) &&  (interArrivalTime(i) <= cdfrands(2)))
                IaT(i+1) = 2 ;
            end
            if((interArrivalTime(i) >= firstrand(3)) &&  (interArrivalTime(i) <= cdfrands(3)))
                IaT(i+1) = 3 ;
            end
            if((interArrivalTime(i) >= firstrand(4)) &&  (interArrivalTime(i) <= cdfrands(4)))
                IaT(i+1) = 4 ;
            end
            if((interArrivalTime(i) >= firstrand(5)) &&  (interArrivalTime(i) <= cdfrands(5)))
                IaT(i+1) = 5 ;
            end
            
        end
   
        
        
        %  Arrival Time    
        ArrivalTime(1)= 0;
        for i = 1:length(interArrivalTime)
            ArrivalTime(i+1) = ArrivalTime(i)+ IaT(i+1);
        end
        
        
        
        
        
        
        %SERVICE TIME 
        
        
        
        serviceTime ;
        
        vt1 = [0.1 0.5 0.1 0.05 0.25];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        %    service time range 
        
        for i = 1:x
            if((serviceTime(i) >= firstrand(1)) &&  (serviceTime(i) <= cdfrands(1)))
                st(i) = 2 ;
            end
            if((serviceTime(i) >= firstrand(2)) &&  (serviceTime(i) <= cdfrands(2)))
                st(i) = 3 ;
            end
            if((serviceTime(i) >= firstrand(3)) &&  (serviceTime(i) <= cdfrands(3)))
                st(i) = 4 ;
            end
            if((serviceTime(i) >= firstrand(4)) &&  (serviceTime(i) <= cdfrands(4)))
                st(i) = 5 ;
            end
            if((serviceTime(i) >= firstrand(5)) &&  (serviceTime(i) <= cdfrands(5)))
                st(i) = 6 ;
            end
            
        end
        
        
       
        
        %       SERVICE TIME for Counter 2 
        
        serviceTime2 = serviceTime;
        
        vt1 = [0.32 0.3 0.2 0.04 0.14];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        
        for i = 1:x
            if((serviceTime2(i) >= firstrand(1)) &&  (serviceTime2(i) <= cdfrands(1)))
                st2(i) = 3 ;
            end
            if((serviceTime2(i) >= firstrand(2)) &&  (serviceTime2(i) <= cdfrands(2)))
                st2(i) = 4 ;
            end
            if((serviceTime2(i) >= firstrand(3)) &&  (serviceTime2(i) <= cdfrands(3)))
                st2(i) = 5 ;
            end
            if((serviceTime2(i) >= firstrand(4)) &&  (serviceTime2(i) <= cdfrands(4)))
                st2(i) = 6 ;
            end
            if((serviceTime2(i) >= firstrand(5)) &&  (serviceTime2(i) <= cdfrands(5)))
                st2(i) = 7 ;
            end
            
        end  
        
        
    
        
        %Time Service Ends = Service Time Counter 1
        tse(1) =  st(1);
        
        
        %   Intializing values for Time Service Begins & Ends
        for i = 1:length(interArrivalTime)
            if (tse(i) >  ArrivalTime(i+1))
                tsb(i+1) = tse(i);
                
            else
                tsb(i+1) = ArrivalTime(i+1);
            end
            tse(i+1)= tsb(i+1) + st(i+1); 
            
        end

        
        
        
        printf('\n\n\n %69s %50s \n', '-------------|Counter 1|-------------','-------------|Counter 2|-------------')  
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n', 'Customer No.','RN ServiceTime',' ServiceTime  ','Time Service','Time Service', 'ServiceTime  ', 'Time Service', 'Time Service',' Waiting ',' Time ');
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n\n', '            ', '            ','             ','   Begins   ','   Ends     ', '             ', '   Begins   ', '     Ends   ','  Time   ',' spent');
        
        printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s                %0.f                %0.f\n',1  ... 
        ,serviceTime(1),st(1),tsb(1),tse(1),' ',' ',' ',0,tse(1)-ArrivalTime(1))
        
        %    Compares the Arrival time and Time service ends 
        %             TSE > AT = Counter 2
        %             TSE < AT = Counter 1
        
        %    WT = Waiting Time
        sums=st(1);
        sums2 = 0;
        for i = 1:length(interArrivalTime)
            if(tse(i) > ArrivalTime(i+1))
                tsb2(i) = ArrivalTime(i+1);
                tse2(i) = tsb2(i) + st2(i+1);
                WT(i) = tsb2(i) - ArrivalTime(i+1);
                timeSpent(i) = tse2(i) - ArrivalTime(i+1);
                
                printf('\n       %0.f            %0.f        %15s     %10s   %10s           %0.f              %0.f               %0.f            %0.f                %0.f \n',i+1  ... 
                ,serviceTime2(i+1),' ',' ',' ',st2(i+1),tsb2(i),tse2(i),WT(i),timeSpent(i))
                
                
                tse(i+1) = tse(i);
                sums2= sums2 + st2(i+1);
                
            else
                tsb(i) = ArrivalTime(i+1);
                tse(i) = tsb(i)+st(i+1);
                WT2(i) = tsb(i) - ArrivalTime(i+1);
                timeSpent(i) = tse(i) - ArrivalTime(i+1);
                
                
                printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s             %0.f                %0.f\n',i+1  ... 
                ,serviceTime(i+1),st(i+1),tsb(i),tse(i),' ',' ',' ',WT2(i),timeSpent(i))
                tse(i+1) = tse(i);
                
                sums= sums + st(i+1);
            end
        end
        
        

        
        % Average Waiting Time
        
        TotalWaitingTime = 0;
        
        for i = 1:length(interArrivalTime)
            TotalWaitingTime = TotalWaitingTime + WT(i);
            
        end
        
        AvgWaitingTime = TotalWaitingTime/length(serviceTime);
        
        printf('\n\nThe Average Waiting Time: %0.f ', AvgWaitingTime) 
        
        
        
        % Average Time Spent
        
        TotalTimeSpent = 0;
        
        for s = 1:length(interArrivalTime)
            TotalTimeSpent = TotalTimeSpent + timeSpent(s);
        end
        
        AvgTimeSpent = TotalTimeSpent/length(serviceTime);
        
        printf('\n\nThe Average Time Spent: %0.f ', AvgTimeSpent)
        
        
        
        % The probability that a customer has to wait
        
        count = 0;
        
        for m = 1:length(interArrivalTime)
            if (WT(m) > 0)
                count = count + 1;
            end
        end          	  
        
        probability = count/length(serviceTime);
        
        printf('\n\nThe probability that a customer has to wait: %0.f  \n', probability)
        
        
        
        % Average service time for each counter
        
        % counter 1
        
        AvgServiceTime = sums/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 1: %0.1f \n', AvgServiceTime)
        
        
        % counter 2
        
        AvgServiceTime2 = sums2/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 2: %0.1f ', AvgServiceTime2)   
        
        disp(' ')
        
        
        
        
        
        
        
        %             **************************choice 3
    elseif (choice ==3)
 
        vt1 = [0.3 0.1 0.2 0.25 0.15];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        rnd1 = round(vt1*100)/100;
        rands = round(rnd1*100);
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        %Inter Arrival Time Range
        
        for i = 1:length(interArrivalTime)
            if((interArrivalTime(i) >= firstrand(1)) &&  (interArrivalTime(i) <= cdfrands(1)))
                IaT(i+1) = 1 ;
            end
            if((interArrivalTime(i) >= firstrand(2)) &&  (interArrivalTime(i) <= cdfrands(2)))
                IaT(i+1) = 2 ;
            end
            if((interArrivalTime(i) >= firstrand(3)) &&  (interArrivalTime(i) <= cdfrands(3)))
                IaT(i+1) = 3 ;
            end
            if((interArrivalTime(i) >= firstrand(4)) &&  (interArrivalTime(i) <= cdfrands(4)))
                IaT(i+1) = 4 ;
            end
            if((interArrivalTime(i) >= firstrand(5)) &&  (interArrivalTime(i) <= cdfrands(5)))
                IaT(i+1) = 5 ;
            end
            
        end
        
        
        
        %  Arrival Time    
        ArrivalTime(1)= 0;
        for i = 1:length(interArrivalTime)
            ArrivalTime(i+1) = ArrivalTime(i)+ IaT(i+1);
        end
        
        
        
        
        
        
        %SERVICE TIME 
        
        
        
        serviceTime ;
        
        vt1 = [0.1 0.5 0.1 0.05 0.25];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        %    service time range 
        
        for i = 1:x
            if((serviceTime(i) >= firstrand(1)) &&  (serviceTime(i) <= cdfrands(1)))
                st(i) = 2 ;
            end
            if((serviceTime(i) >= firstrand(2)) &&  (serviceTime(i) <= cdfrands(2)))
                st(i) = 3 ;
            end
            if((serviceTime(i) >= firstrand(3)) &&  (serviceTime(i) <= cdfrands(3)))
                st(i) = 4 ;
            end
            if((serviceTime(i) >= firstrand(4)) &&  (serviceTime(i) <= cdfrands(4)))
                st(i) = 5 ;
            end
            if((serviceTime(i) >= firstrand(5)) &&  (serviceTime(i) <= cdfrands(5)))
                st(i) = 6 ;
            end
            
        end
        

        
        %       SERVICE TIME for Counter 2 
        
        serviceTime2 = serviceTime;
        
        vt1 = [0.32 0.3 0.2 0.04 0.14];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        
        for i = 1:x
            if((serviceTime2(i) >= firstrand(1)) &&  (serviceTime2(i) <= cdfrands(1)))
                st2(i) = 3 ;
            end
            if((serviceTime2(i) >= firstrand(2)) &&  (serviceTime2(i) <= cdfrands(2)))
                st2(i) = 4 ;
            end
            if((serviceTime2(i) >= firstrand(3)) &&  (serviceTime2(i) <= cdfrands(3)))
                st2(i) = 5 ;
            end
            if((serviceTime2(i) >= firstrand(4)) &&  (serviceTime2(i) <= cdfrands(4)))
                st2(i) = 6 ;
            end
            if((serviceTime2(i) >= firstrand(5)) &&  (serviceTime2(i) <= cdfrands(5)))
                st2(i) = 7 ;
            end
            
        end  
        
        
    
        
        
        
        %Time Service Ends = Service Time Counter 1
        tse(1) =  st(1);
        
        
        %   Intializing values for Time Service Begins & Ends
        for i = 1:length(interArrivalTime)
            if (tse(i) >  ArrivalTime(i+1))
                tsb(i+1) = tse(i);
                
            else
                tsb(i+1) = ArrivalTime(i+1);
            end
            tse(i+1)= tsb(i+1) + st(i+1); 
            
        end
        

        
        
        
        
        printf('\n\n\n %69s %50s \n', '-------------|Counter 1|-------------','-------------|Counter 2|-------------')  
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n', 'Customer No.','RN ServiceTime',' ServiceTime  ','Time Service','Time Service', 'ServiceTime  ', 'Time Service', 'Time Service',' Waiting ',' Time ');
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n\n', '            ', '            ','             ','   Begins   ','   Ends     ', '             ', '   Begins   ', '     Ends   ','  Time   ',' spent');
        
        printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s                %0.f                %0.f\n',1  ... 
        ,serviceTime(1),st(1),tsb(1),tse(1),' ',' ',' ',0,tse(1)-ArrivalTime(1))
        
        %    Compares the Arrival time and Time service ends 
        %             TSE > AT = Counter 2
        %             TSE < AT = Counter 1
        
        %    WT = Waiting Time
        sums=st(1);
        sums2 = 0;
        for i = 1:length(interArrivalTime)
            if(tse(i) > ArrivalTime(i+1))
                tsb2(i) = ArrivalTime(i+1);
                tse2(i) = tsb2(i) + st2(i+1);
                WT(i) = tsb2(i) - ArrivalTime(i+1);
                timeSpent(i) = tse2(i) - ArrivalTime(i+1);
                
                printf('\n       %0.f            %0.f        %15s     %10s   %10s           %0.f              %0.f               %0.f            %0.f                %0.f \n',i+1  ... 
                ,serviceTime2(i+1),' ',' ',' ',st2(i+1),tsb2(i),tse2(i),WT(i),timeSpent(i))
                
                
                tse(i+1) = tse(i);
                sums2= sums2 + st2(i+1);
                
            else
                tsb(i) = ArrivalTime(i+1);
                tse(i) = tsb(i)+st(i+1);
                WT2(i) = tsb(i) - ArrivalTime(i+1);
                timeSpent(i) = tse(i) - ArrivalTime(i+1);
                
                
                printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s             %0.f                %0.f\n',i+1  ... 
                ,serviceTime(i+1),st(i+1),tsb(i),tse(i),' ',' ',' ',WT2(i),timeSpent(i))
                tse(i+1) = tse(i);
                
                sums= sums + st(i+1);
            end
        end
        

        
        
        % Average Waiting Time
        
        TotalWaitingTime = 0;
        
        for i = 1:length(interArrivalTime)
            TotalWaitingTime = TotalWaitingTime + WT(i);
            
        end
        
        AvgWaitingTime = TotalWaitingTime/length(serviceTime);
        
        printf('\n\nThe Average Waiting Time: %0.f ', AvgWaitingTime) 
        
        
        
        % Average Time Spent
        
        TotalTimeSpent = 0;
        
        for s = 1:length(interArrivalTime)
            TotalTimeSpent = TotalTimeSpent + timeSpent(s);
        end
        
        AvgTimeSpent = TotalTimeSpent/length(serviceTime);
        
        printf('\n\nThe Average Time Spent: %0.f ', AvgTimeSpent)
        
        
        
        % The probability that a customer has to wait
        
        count = 0;
        
        for m = 1:length(interArrivalTime)
            if (WT(m) > 0)
                count = count + 1;
            end
        end          	  
        
        probability = count/length(serviceTime);
        
        printf('\n\nThe probability that a customer has to wait: %0.f  \n', probability)
        
        
        
        % Average service time for each counter
        
        % counter 1
        
        AvgServiceTime = sums/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 1: %0.1f \n', AvgServiceTime)
        
        
        % counter 2
        
        AvgServiceTime2 = sums2/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 2: %0.1f ', AvgServiceTime2)   
        
        disp(' ')
        
        %             ******************choice 4
    elseif (choice == 4)
 
        vt1 = [0.3 0.1 0.2 0.25 0.15];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        rnd1 = round(vt1*100)/100;
        rands = round(rnd1*100);
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        %Inter Arrival Time Range
        
        for i = 1:length(interArrivalTime)
            if((interArrivalTime(i) >= firstrand(1)) &&  (interArrivalTime(i) <= cdfrands(1)))
                IaT(i+1) = 1 ;
            end
            if((interArrivalTime(i) >= firstrand(2)) &&  (interArrivalTime(i) <= cdfrands(2)))
                IaT(i+1) = 2 ;
            end
            if((interArrivalTime(i) >= firstrand(3)) &&  (interArrivalTime(i) <= cdfrands(3)))
                IaT(i+1) = 3 ;
            end
            if((interArrivalTime(i) >= firstrand(4)) &&  (interArrivalTime(i) <= cdfrands(4)))
                IaT(i+1) = 4 ;
            end
            if((interArrivalTime(i) >= firstrand(5)) &&  (interArrivalTime(i) <= cdfrands(5)))
                IaT(i+1) = 5 ;
            end
            
        end
        
        
        
        %  Arrival Time    
        ArrivalTime(1)= 0;
        for i = 1:length(interArrivalTime)
            ArrivalTime(i+1) = ArrivalTime(i)+ IaT(i+1);
        end
        
        
        
        
        
        
        %SERVICE TIME 
        
        
        
        serviceTime ;
        
        vt1 = [0.1 0.5 0.1 0.05 0.25];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        %    service time range 
        
        for i = 1:x
            if((serviceTime(i) >= firstrand(1)) &&  (serviceTime(i) <= cdfrands(1)))
                st(i) = 2 ;
            end
            if((serviceTime(i) >= firstrand(2)) &&  (serviceTime(i) <= cdfrands(2)))
                st(i) = 3 ;
            end
            if((serviceTime(i) >= firstrand(3)) &&  (serviceTime(i) <= cdfrands(3)))
                st(i) = 4 ;
            end
            if((serviceTime(i) >= firstrand(4)) &&  (serviceTime(i) <= cdfrands(4)))
                st(i) = 5 ;
            end
            if((serviceTime(i) >= firstrand(5)) &&  (serviceTime(i) <= cdfrands(5)))
                st(i) = 6 ;
            end
            
        end
        
        
 
        
        %       SERVICE TIME for Counter 2 

        
        serviceTime2 = serviceTime;
        
        vt1 = [0.32 0.3 0.2 0.04 0.14];
        
        cdf1 = vt1(1);
        cdf2 = vt1(1) + vt1(2);
        cdf3 = vt1(3) + cdf2;
        cdf4 = vt1(4) + cdf3;
        cdf5 = vt1(5) + cdf4;
        vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
        
        
        
        cdfrnd = round(vt2*100)/100;
        cdfrands = round(cdfrnd*100);
        
        
        firstrand = [1 cdfrands(1)+1 cdfrands(2)+1 cdfrands(3)+1 cdfrands(4)+1];
        
        
        
        for i = 1:x
            if((serviceTime2(i) >= firstrand(1)) &&  (serviceTime2(i) <= cdfrands(1)))
                st2(i) = 3 ;
            end
            if((serviceTime2(i) >= firstrand(2)) &&  (serviceTime2(i) <= cdfrands(2)))
                st2(i) = 4 ;
            end
            if((serviceTime2(i) >= firstrand(3)) &&  (serviceTime2(i) <= cdfrands(3)))
                st2(i) = 5 ;
            end
            if((serviceTime2(i) >= firstrand(4)) &&  (serviceTime2(i) <= cdfrands(4)))
                st2(i) = 6 ;
            end
            if((serviceTime2(i) >= firstrand(5)) &&  (serviceTime2(i) <= cdfrands(5)))
                st2(i) = 7 ;
            end
            
        end  
        

        
        
        %Time Service Ends = Service Time Counter 1
        tse(1) =  st(1);
        
        
        %   Intializing values for Time Service Begins & Ends
        for i = 1:length(interArrivalTime)
            if (tse(i) >  ArrivalTime(i+1))
                tsb(i+1) = tse(i);
                
            else
                tsb(i+1) = ArrivalTime(i+1);
            end
            tse(i+1)= tsb(i+1) + st(i+1); 
            
        end
   
        printf('\n\n\n %69s %50s \n', '-------------|Counter 1|-------------','-------------|Counter 2|-------------')  
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n', 'Customer No.','RN ServiceTime',' ServiceTime  ','Time Service','Time Service', 'ServiceTime  ', 'Time Service', 'Time Service',' Waiting ',' Time ');
        printf('\n%s %16s %15s  %10s %15s %15s %10s %15s %15s %15s     \n\n', '            ', '            ','             ','   Begins   ','   Ends     ', '             ', '   Begins   ', '     Ends   ','  Time   ',' spent');
        
        printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s                %0.f                %0.f\n',1  ... 
        ,serviceTime(1),st(1),tsb(1),tse(1),' ',' ',' ',0,tse(1)-ArrivalTime(1))
        
        %    Compares the Arrival time and Time service ends 
        %             TSE > AT = Counter 2
        %             TSE < AT = Counter 1
        
        %    WT = Waiting Time
        sums=st(1);
        sums2 = 0;
        for i = 1:length(interArrivalTime)
            if(tse(i) > ArrivalTime(i+1))
                tsb2(i) = ArrivalTime(i+1);
                tse2(i) = tsb2(i) + st2(i+1);
                WT(i) = tsb2(i) - ArrivalTime(i+1);
                timeSpent(i) = tse2(i) - ArrivalTime(i+1);
                
                printf('\n       %0.f            %0.f        %15s     %10s   %10s           %0.f              %0.f               %0.f            %0.f                %0.f \n',i+1  ... 
                ,serviceTime2(i+1),' ',' ',' ',st2(i+1),tsb2(i),tse2(i),WT(i),timeSpent(i))
                
                
                tse(i+1) = tse(i);
                sums2= sums2 + st2(i+1);
                
            else
                tsb(i) = ArrivalTime(i+1);
                tse(i) = tsb(i)+st(i+1);
                WT2(i) = tsb(i) - ArrivalTime(i+1);
                timeSpent(i) = tse(i) - ArrivalTime(i+1);
                
                
                printf('\n       %0.f            %0.f            %0.f              %0.f             %0.f       %10s  %10s  %20s             %0.f                %0.f\n',i+1  ... 
                ,serviceTime(i+1),st(i+1),tsb(i),tse(i),' ',' ',' ',WT2(i),timeSpent(i))
                tse(i+1) = tse(i);
                
                sums= sums + st(i+1);
            end
        end
        

        % Average Waiting Time
        
        TotalWaitingTime = 0;
        
        for i = 1:length(interArrivalTime)
            TotalWaitingTime = TotalWaitingTime + WT(i);
            
        end
        
        AvgWaitingTime = TotalWaitingTime/length(serviceTime);
        
        printf('\n\nThe Average Waiting Time: %0.f ', AvgWaitingTime) 
        
        
        
        % Average Time Spent
        
        TotalTimeSpent = 0;
        
        for s = 1:length(interArrivalTime)
            TotalTimeSpent = TotalTimeSpent + timeSpent(s);
        end
        
        AvgTimeSpent = TotalTimeSpent/length(serviceTime);
        
        printf('\n\nThe Average Time Spent: %0.f ', AvgTimeSpent)
        
        
        
        % The probability that a customer has to wait
        
        count = 0;
        
        for m = 1:length(interArrivalTime)
            if (WT(m) > 0)
                count = count + 1;
            end
        end          	  
        
        probability = count/length(serviceTime);
        
        printf('\n\nThe probability that a customer has to wait: %0.f  \n', probability)
        
        
        
        % Average service time for each counter
        
        % counter 1
        
        AvgServiceTime = sums/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 1: %0.1f \n', AvgServiceTime)
        
        
        % counter 2
        
        AvgServiceTime2 = sums2/length(serviceTime);
        
        printf('\n\nThe Average Service Time For Counter 2: %0.1f ', AvgServiceTime2)   
        
        disp(' ')
    else
        output = 'Invalid input';
    end        