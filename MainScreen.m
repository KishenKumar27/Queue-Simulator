function MainScreen
    
    printf('\nRandom Number Generators')
    printf('\n------------------------\n')
    printf('1. Using random function\n')
    printf('2. Multiplicative LCG\n')
    printf('3. Additive LCG\n')
    printf('4. Custom Random Number Generator\n\n')
    prompt = 'Please choose random number generator: ';
    choice = input(prompt)
    
    prompt = 'Enter the number of customers for the whole simulation: ';
    x = input(prompt)
    
    switch(choice)
        case{1}
            interArrivalTime = [round(rand(1, x-1)*100)];
            serviceTime = [round(rand(1, x)*100)];
            prompt_1 = 'Enter the maximum number of customers that are allowed to be in the centre: ';
            
            y = input(prompt_1)
            
            while(x < y)
                printf('Customer limit has been exceeded or invalid input.\n');
                printf('Number Of Customers Should Be Less Than Number Of Trials (n-1).\n\n');
                printf('Please Try Again...\n\n');
                n = input(numRange)
                x = input(prompt)
                y = input(prompt_1)
                
            end
            
            % CheckIn
            
            printf('\n\nTime Zone Track\n\n')
            tic  %reset and start the computers stop watch
            for i = 1:x
                printf('Hi, Please scan your temperature. [Enter] \n')
                prompt = 'Click enter to shoot your forehead: ';
                Temperature_taken = input(prompt)
                Arrival_Time = toc
                intArr(i) = Arrival_Time;
                r=(40.0-30.0)*rand(1,5)+30.0;
                doubleRand(i)= r; 
                
                
                printf('Welcome to the shop!! \n')
                printf('You are now at the Centre \n') 
                prompt1 = 'Please Enter any key for check In: ';
                checkIn = input(prompt1)
                Centre_Time=toc;
                intCent(i)=Centre_Time;
                
                printf('\n Customer %0.0f \n',i)
                printf('Thank You For Coming!! \n')
                printf('Visit us Again :)\n')
                prompt2 = 'Please give us rating by entering a Number: ';
                leave = input(prompt2)
                Departure_Time=(30-20)*rand(1,5)+20;
                intDepa(i)= Departure_Time;
                Service_Time=(100-10)*rand(1,x)+10;
                intServ(i) = Service_Time;
            end 
            
            
            printf('\n\nTime Zone Track')
            printf('\n%s %20s %20s %20s %20s \n', 'Customer', 'Temperature','Arrival Time','Centre Time','Departure Time')  
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),0,0)
                else
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),intCent(i),intDepa(i))               
                end
                
            end
            
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and was not allowed to enter the centre\n',i                ...
                    ,intArr(i))
                else
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and entered the centre at minute %0.0f Departure of Customer at %0.0f \n',i                ...
                    ,intArr(i),intCent(i),intDepa(i))               
                    
                end
                
            end
            
            % Inter-Arrival     
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
            Icdfrands = round(cdfrnd*100);
            
            
            Ifirstrand = [1 Icdfrands(1)+1 Icdfrands(2)+1 Icdfrands(3)+1 Icdfrands(4)+1];
            
            printf('\n\nInter-Arrival Time Table\n')
            printf('------------------------\n')
            
            printf('\n%s %16s %14s %30s \n', 'Inter-Arrival Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                it(i) = i;
                
                printf('\n        %0.0f                  %0.2f                %0.2f                 %0.0f %s %0.0f\n', it(i)               ...
                , vt1(i), vt2(i),Ifirstrand(i), '-',Icdfrands(i))
            end
            
            % Service Time	 	       
            % Counter 1    
            vt1 = [0.1 0.5 0.1 0.05 0.25];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands = round(cdfrnd*100);
            
            
            Sfirstrand = [1 Scdfrands(1)+1 Scdfrands(2)+1 Scdfrands(3)+1 Scdfrands(4)+1];
            
            printf('\n\nService Time Table\n')
            printf('------------------\n')
            
            printf('\nCounter 1')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+1                ...
                , vt1(i), vt2(i),Sfirstrand(i), '-',Scdfrands(i))
            end
            
            
            
            
            % Counter 2    
            vt1 = [0.32 0.3 0.2 0.04 0.14];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands2 = round(cdfrnd*100);
            
            
            Sfirstrand2 = [1 Scdfrands2(1)+1 Scdfrands2(2)+1 Scdfrands2(3)+1 Scdfrands2(4)+1];
            
            
            printf('\n\nCounter 2')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+2                ...
                , vt1(i), vt2(i),Sfirstrand2(i), '-',Scdfrands2(i))
            end
            
            %Table 1
            printf('\n\n');
            
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'Customer', 'Temperature','      Random Number for ','Inter-Arrival','Arrival','No. of Customers','Time entering')  
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'no.     ', '(Celsius)  ','      Inter Arrival-Time','    Time     ',' Time  ',' In the Centre  ','  The centre ')  
            
            arrival = 0;
            
            for i = 1:length(intArr)
                Customer_number =(y-(y-1))*rand(1,x)+(y-1);
                doubleRandcustomer(i)= Customer_number;
                
                if(i == 1)
                    printf('\n  %0.0f              %0.2f                   -                    -                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), arrival(i), 0, 0) 
                elseif  doubleRand(i)> 37.5
                    printf('\n  %0.0f              %0.2f                   %0.0f                     %0.0f                       %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), 0, 0, arrival,0,0)
                else
                    if( interArrivalTime(i-1) >= Ifirstrand(1) & interArrivalTime(i-1) <= Icdfrands(1) )
                        interArr = 1;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(2) & interArrivalTime(i-1) <= Icdfrands(2) )
                        interArr = 2;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(3) & interArrivalTime(i-1) <= Icdfrands(3) )
                        interArr = 3;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(4) & interArrivalTime(i-1) <= Icdfrands(4) )
                        interArr = 4;
                    else
                        interArr = 5;
                    end
                    
                    arrival = arrival + interArr;
                    printf('\n  %0.0f              %0.2f                   %0.0f                    %0.0f                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), interArrivalTime(i-1), interArr, arrival,doubleRandcustomer(i),intCent(i))       
                end
            end
            
            
            randomizer(choice,interArrivalTime,serviceTime,x)
            
            disp(' ')
            
            
            
            
            

            
        case{2}
            intArr(1) = randi(0, 100);
            for i=2:x-1
                intArr(i) = mod((13*intArr(i-1)), 55);
            end
            interArrivalTime = [intArr]
            
            serArr(1) = randi(0, 100);
            for i=2:x
                serArr(i) = mod((13*intArr(i-1)), 55);
            end
            serviceTime = [serArr]
            prompt_1 = 'Enter the maximum number of customers that are allowed to be in the centre: ';
            
            y = input(prompt_1)
            
            while(x < y)
                printf('Customer limit has been exceeded or invalid input.\n');
                printf('Number Of Customers Should Be Less Than Number Of Trials (n-1).\n\n');
                printf('Please Try Again...\n\n');
                n = input(numRange)
                x = input(prompt)
                y = input(prompt_1)
                
            end
            
            % CheckIn
            
            printf('\n\nTime Zone Track\n\n')
            tic  %reset and start the computers stop watch
            for i = 1:x
                printf('Hi, Please scan your temperature. [Enter] \n')
                prompt = 'Click enter to shoot your forehead: ';
                Temperature_taken = input(prompt)
                Arrival_Time = toc
                intArr(i) = Arrival_Time;
                r=(40.0-30.0)*rand(1,5)+30.0;
                doubleRand(i)= r; 
                
                
                printf('Welcome to the shop!! \n')
                printf('You are now at the Centre \n') 
                prompt1 = 'Please Enter any key for check In: ';
                checkIn = input(prompt1)
                Centre_Time=toc;
                intCent(i)=Centre_Time;
                
                printf('\n Customer %0.0f \n',i)
                printf('Thank You For Coming!! \n')
                printf('Visit us Again :)\n')
                prompt2 = 'Please give us rating by entering a Number: ';
                leave = input(prompt2)
                Departure_Time=(30-20)*rand(1,5)+20;
                intDepa(i)= Departure_Time;
                Service_Time=(100-10)*rand(1,x)+10;
                intServ(i) = Service_Time;
            end 
            
            
            printf('\n\nTime Zone Track')
            printf('\n%s %20s %20s %20s %20s \n', 'Customer', 'Temperature','Arrival Time','Centre Time','Departure Time')  
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),0,0)
                else
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),intCent(i),intDepa(i))               
                end
                
            end
            
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and was not allowed to enter the centre\n',i                ...
                    ,intArr(i))
                else
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and entered the centre at minute %0.0f Departure of Customer at %0.0f \n',i                ...
                    ,intArr(i),intCent(i),intDepa(i))               
                    
                end
                
            end
            
            % Inter-Arrival     
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
            Icdfrands = round(cdfrnd*100);
            
            
            Ifirstrand = [1 Icdfrands(1)+1 Icdfrands(2)+1 Icdfrands(3)+1 Icdfrands(4)+1];
            
            printf('\n\nInter-Arrival Time Table\n')
            printf('------------------------\n')
            
            printf('\n%s %16s %14s %30s \n', 'Inter-Arrival Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                it(i) = i;
                
                printf('\n        %0.0f                  %0.2f                %0.2f                 %0.0f %s %0.0f\n', it(i)               ...
                , vt1(i), vt2(i),Ifirstrand(i), '-',Icdfrands(i))
            end
            
            % Service Time	 	       
            % Counter 1    
            vt1 = [0.1 0.5 0.1 0.05 0.25];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands = round(cdfrnd*100);
            
            
            Sfirstrand = [1 Scdfrands(1)+1 Scdfrands(2)+1 Scdfrands(3)+1 Scdfrands(4)+1];
            
            printf('\n\nService Time Table\n')
            printf('------------------\n')
            
            printf('\nCounter 1')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+1                ...
                , vt1(i), vt2(i),Sfirstrand(i), '-',Scdfrands(i))
            end
            
            
            
            
            % Counter 2    
            vt1 = [0.32 0.3 0.2 0.04 0.14];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands2 = round(cdfrnd*100);
            
            
            Sfirstrand2 = [1 Scdfrands2(1)+1 Scdfrands2(2)+1 Scdfrands2(3)+1 Scdfrands2(4)+1];
            
            
            printf('\n\nCounter 2')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+2                ...
                , vt1(i), vt2(i),Sfirstrand2(i), '-',Scdfrands2(i))
            end
            
            %Table 1
            printf('\n\n');
            
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'Customer', 'Temperature','      Random Number for ','Inter-Arrival','Arrival','No. of Customers','Time entering')  
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'no.     ', '(Celsius)  ','      Inter Arrival-Time','    Time     ',' Time  ',' In the Centre  ','  The centre ')  
            
            arrival = 0;
            
            for i = 1:length(intArr)
                Customer_number =(y-(y-1))*rand(1,x)+(y-1);
                doubleRandcustomer(i)= Customer_number;
                
                if(i == 1)
                    printf('\n  %0.0f              %0.2f                   -                    -                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), arrival(i), 0, 0) 
                elseif  doubleRand(i)> 37.5
                    printf('\n  %0.0f              %0.2f                   %0.0f                     %0.0f                       %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), 0, 0, arrival,0,0)
                else
                    if( interArrivalTime(i-1) >= Ifirstrand(1) & interArrivalTime(i-1) <= Icdfrands(1) )
                        interArr = 1;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(2) & interArrivalTime(i-1) <= Icdfrands(2) )
                        interArr = 2;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(3) & interArrivalTime(i-1) <= Icdfrands(3) )
                        interArr = 3;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(4) & interArrivalTime(i-1) <= Icdfrands(4) )
                        interArr = 4;
                    else
                        interArr = 5;
                    end
                    
                    arrival = arrival + interArr;
                    printf('\n  %0.0f              %0.2f                   %0.0f                    %0.0f                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), interArrivalTime(i-1), interArr, arrival,doubleRandcustomer(i),intCent(i))       
                end
            end
            
            
            randomizer(choice,interArrivalTime,serviceTime,x)
            
            disp(' ')
            
            
            
        case{3}
            intArr(1) = randi(0, 100);
            for i=2:x-1
                intArr(i) = mod((intArr(i-1)+78), 34);
            end
            interArrivalTime = [intArr]
            
            serArr(1) = randi(0, 100);
            for i=2:x
                serArr(i) = mod((serArr(i-1)+65), 75);
            end
            serviceTime = [serArr]
            
            prompt_1 = 'Enter the maximum number of customers that are allowed to be in the centre: ';
            
            y = input(prompt_1)
            
            while(x < y)
                printf('Customer limit has been exceeded or invalid input.\n');
                printf('Number Of Customers Should Be Less Than Number Of Trials (n-1).\n\n');
                printf('Please Try Again...\n\n');
                n = input(numRange)
                x = input(prompt)
                y = input(prompt_1)
                
            end
            
            % CheckIn
            
            printf('\n\nTime Zone Track\n\n')
            tic  %reset and start the computers stop watch
            for i = 1:x
                printf('Hi, Please scan your temperature. [Enter] \n')
                prompt = 'Click enter to shoot your forehead: ';
                Temperature_taken = input(prompt)
                Arrival_Time = toc
                intArr(i) = Arrival_Time;
                r=(40.0-30.0)*rand(1,5)+30.0;
                doubleRand(i)= r; 
                
                
                printf('Welcome to the shop!! \n')
                printf('You are now at the Centre \n') 
                prompt1 = 'Please Enter any key for check In: ';
                checkIn = input(prompt1)
                Centre_Time=toc;
                intCent(i)=Centre_Time;
                
                printf('\n Customer %0.0f \n',i)
                printf('Thank You For Coming!! \n')
                printf('Visit us Again :)\n')
                prompt2 = 'Please give us rating by entering a Number: ';
                leave = input(prompt2)
                Departure_Time=(30-20)*rand(1,5)+20;
                intDepa(i)= Departure_Time;
                Service_Time=(100-10)*rand(1,x)+10;
                intServ(i) = Service_Time;
            end 
            
            
            printf('\n\nTime Zone Track')
            printf('\n%s %20s %20s %20s %20s \n', 'Customer', 'Temperature','Arrival Time','Centre Time','Departure Time')  
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),0,0)
                else
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),intCent(i),intDepa(i))               
                end
                
            end
            
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and was not allowed to enter the centre\n',i                ...
                    ,intArr(i))
                else
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and entered the centre at minute %0.0f Departure of Customer at %0.0f \n',i                ...
                    ,intArr(i),intCent(i),intDepa(i))               
                    
                end
                
            end
            
            % Inter-Arrival     
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
            Icdfrands = round(cdfrnd*100);
            
            
            Ifirstrand = [1 Icdfrands(1)+1 Icdfrands(2)+1 Icdfrands(3)+1 Icdfrands(4)+1];
            
            printf('\n\nInter-Arrival Time Table\n')
            printf('------------------------\n')
            
            printf('\n%s %16s %14s %30s \n', 'Inter-Arrival Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                it(i) = i;
                
                printf('\n        %0.0f                  %0.2f                %0.2f                 %0.0f %s %0.0f\n', it(i)               ...
                , vt1(i), vt2(i),Ifirstrand(i), '-',Icdfrands(i))
            end
            
            % Service Time	 	       
            % Counter 1    
            vt1 = [0.1 0.5 0.1 0.05 0.25];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands = round(cdfrnd*100);
            
            
            Sfirstrand = [1 Scdfrands(1)+1 Scdfrands(2)+1 Scdfrands(3)+1 Scdfrands(4)+1];
            
            printf('\n\nService Time Table\n')
            printf('------------------\n')
            
            printf('\nCounter 1')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+1                ...
                , vt1(i), vt2(i),Sfirstrand(i), '-',Scdfrands(i))
            end
            
            
            
            
            % Counter 2    
            vt1 = [0.32 0.3 0.2 0.04 0.14];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands2 = round(cdfrnd*100);
            
            
            Sfirstrand2 = [1 Scdfrands2(1)+1 Scdfrands2(2)+1 Scdfrands2(3)+1 Scdfrands2(4)+1];
            
            
            printf('\n\nCounter 2')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+2                ...
                , vt1(i), vt2(i),Sfirstrand2(i), '-',Scdfrands2(i))
            end
            
            %Table 1
            printf('\n\n');
            
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'Customer', 'Temperature','      Random Number for ','Inter-Arrival','Arrival','No. of Customers','Time entering')  
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'no.     ', '(Celsius)  ','      Inter Arrival-Time','    Time     ',' Time  ',' In the Centre  ','  The centre ')  
            
            arrival = 0;
            
            for i = 1:length(intArr)
                Customer_number =(y-(y-1))*rand(1,x)+(y-1);
                doubleRandcustomer(i)= Customer_number;
                
                if(i == 1)
                    printf('\n  %0.0f              %0.2f                   -                    -                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), arrival(i), 0, 0) 
                elseif  doubleRand(i)> 37.5
                    printf('\n  %0.0f              %0.2f                   %0.0f                     %0.0f                       %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), 0, 0, arrival,0,0)
                else
                    if( interArrivalTime(i-1) >= Ifirstrand(1) & interArrivalTime(i-1) <= Icdfrands(1) )
                        interArr = 1;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(2) & interArrivalTime(i-1) <= Icdfrands(2) )
                        interArr = 2;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(3) & interArrivalTime(i-1) <= Icdfrands(3) )
                        interArr = 3;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(4) & interArrivalTime(i-1) <= Icdfrands(4) )
                        interArr = 4;
                    else
                        interArr = 5;
                    end
                    
                    arrival = arrival + interArr;
                    printf('\n  %0.0f              %0.2f                   %0.0f                    %0.0f                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), interArrivalTime(i-1), interArr, arrival,doubleRandcustomer(i),intCent(i))       
                end
            end
            
            
            randomizer(choice,interArrivalTime,serviceTime,x)
            
            disp(' ')
            
            
            
            
            
            
        case{4}
            interArrivalTime = [mod(round(rand(1, x-1)*80 + 35),101)]
            serviceTime = [mod(round(rand(1, x)*75 + 37),71)]
            
            prompt_1 = 'Enter the maximum number of customers that are allowed to be in the centre: ';
            
            y = input(prompt_1)
            
            while(x < y)
                printf('Customer limit has been exceeded or invalid input.\n');
                printf('Number Of Customers Should Be Less Than Number Of Trials (n-1).\n\n');
                printf('Please Try Again...\n\n');
                n = input(numRange)
                x = input(prompt)
                y = input(prompt_1)
                
            end
            
            % CheckIn
            
            printf('\n\nTime Zone Track\n\n')
            tic  %reset and start the computers stop watch
            for i = 1:x
                printf('Hi, Please scan your temperature. [Enter] \n')
                prompt = 'Click enter to shoot your forehead: ';
                Temperature_taken = input(prompt)
                Arrival_Time = toc
                intArr(i) = Arrival_Time;
                r=(40.0-30.0)*rand(1,5)+30.0;
                doubleRand(i)= r; 
                
                
                printf('Welcome to the shop!! \n')
                printf('You are now at the Centre \n') 
                prompt1 = 'Please Enter any key for check In: ';
                checkIn = input(prompt1)
                Centre_Time=toc;
                intCent(i)=Centre_Time;
                
                printf('\n Customer %0.0f \n',i)
                printf('Thank You For Coming!! \n')
                printf('Visit us Again :)\n')
                prompt2 = 'Please give us rating by entering a Number: ';
                leave = input(prompt2)
                Departure_Time=(30-20)*rand(1,5)+20;
                intDepa(i)= Departure_Time;
                Service_Time=(100-10)*rand(1,x)+10;
                intServ(i) = Service_Time;
            end 
            
            
            printf('\n\nTime Zone Track')
            printf('\n%s %20s %20s %20s %20s \n', 'Customer', 'Temperature','Arrival Time','Centre Time','Departure Time')  
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),0,0)
                else
                    printf('\n        %0.0f            %0.2f                %0.0f                 %0.0f                %0.0f \n',i                ...
                    , doubleRand(i), intArr(i),intCent(i),intDepa(i))               
                end
                
            end
            
            for i = 1:length(intArr)
                if  doubleRand(i)> 37.5
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and was not allowed to enter the centre\n',i                ...
                    ,intArr(i))
                else
                    printf('\n Customer %0.0f  Arrived at minute %0.0f and entered the centre at minute %0.0f Departure of Customer at %0.0f \n',i                ...
                    ,intArr(i),intCent(i),intDepa(i))               
                    
                end
                
            end
            
            % Inter-Arrival     
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
            Icdfrands = round(cdfrnd*100);
            
            
            Ifirstrand = [1 Icdfrands(1)+1 Icdfrands(2)+1 Icdfrands(3)+1 Icdfrands(4)+1];
            
            printf('\n\nInter-Arrival Time Table\n')
            printf('------------------------\n')
            
            printf('\n%s %16s %14s %30s \n', 'Inter-Arrival Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                it(i) = i;
                
                printf('\n        %0.0f                  %0.2f                %0.2f                 %0.0f %s %0.0f\n', it(i)               ...
                , vt1(i), vt2(i),Ifirstrand(i), '-',Icdfrands(i))
            end
            
            % Service Time	 	       
            % Counter 1    
            vt1 = [0.1 0.5 0.1 0.05 0.25];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands = round(cdfrnd*100);
            
            
            Sfirstrand = [1 Scdfrands(1)+1 Scdfrands(2)+1 Scdfrands(3)+1 Scdfrands(4)+1];
            
            printf('\n\nService Time Table\n')
            printf('------------------\n')
            
            printf('\nCounter 1')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+1                ...
                , vt1(i), vt2(i),Sfirstrand(i), '-',Scdfrands(i))
            end
            
            
            
            
            % Counter 2    
            vt1 = [0.32 0.3 0.2 0.04 0.14];
            
            cdf1 = vt1(1);
            cdf2 = vt1(1) + vt1(2);
            cdf3 = vt1(3) + cdf2;
            cdf4 = vt1(4) + cdf3;
            cdf5 = vt1(5) + cdf4;
            vt2 = [cdf1 cdf2 cdf3 cdf4 cdf5];
            
            
            
            cdfrnd = round(vt2*100)/100;
            Scdfrands2 = round(cdfrnd*100);
            
            
            Sfirstrand2 = [1 Scdfrands2(1)+1 Scdfrands2(2)+1 Scdfrands2(3)+1 Scdfrands2(4)+1];
            
            
            printf('\n\nCounter 2')
            printf('\n%s %16s %14s %30s \n', 'Service Time', 'Probability','CDF','Random number range')
            
            for i = 1:length(vt1)
                
                printf('\n        %0.0f            %0.2f                %0.2f                 %0.0f %s %0.0f\n',i+2                ...
                , vt1(i), vt2(i),Sfirstrand2(i), '-',Scdfrands2(i))
            end
            
            %Table 1
            printf('\n\n');
            
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'Customer', 'Temperature','      Random Number for ','Inter-Arrival','Arrival','No. of Customers','Time entering')  
            printf('\n%s %15s %20s %20s %20s %20s %20s \n', 'no.     ', '(Celsius)  ','      Inter Arrival-Time','    Time     ',' Time  ',' In the Centre  ','  The centre ')  
            
            arrival = 0;
            
            for i = 1:length(intArr)
                Customer_number =(y-(y-1))*rand(1,x)+(y-1);
                doubleRandcustomer(i)= Customer_number;
                
                if(i == 1)
                    printf('\n  %0.0f              %0.2f                   -                    -                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), arrival(i), 0, 0) 
                elseif  doubleRand(i)> 37.5
                    printf('\n  %0.0f              %0.2f                   %0.0f                     %0.0f                       %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), 0, 0, arrival,0,0)
                else
                    if( interArrivalTime(i-1) >= Ifirstrand(1) & interArrivalTime(i-1) <= Icdfrands(1) )
                        interArr = 1;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(2) & interArrivalTime(i-1) <= Icdfrands(2) )
                        interArr = 2;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(3) & interArrivalTime(i-1) <= Icdfrands(3) )
                        interArr = 3;
                    elseif( interArrivalTime(i-1) >= Ifirstrand(4) & interArrivalTime(i-1) <= Icdfrands(4) )
                        interArr = 4;
                    else
                        interArr = 5;
                    end
                    
                    arrival = arrival + interArr;
                    printf('\n  %0.0f              %0.2f                   %0.0f                    %0.0f                        %0.0f                  %0.0f                      %0.0f \n',i, doubleRand(i), interArrivalTime(i-1), interArr, arrival,doubleRandcustomer(i),intCent(i))       
                end
            end
            
            
            randomizer(choice,interArrivalTime,serviceTime,x)
            
            disp(' ')
        otherwise
            output = 'Invalid input';
        end
      