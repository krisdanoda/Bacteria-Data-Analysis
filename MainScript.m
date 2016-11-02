
% Initialise
fId = -1;
quitId = -1;

while quitId == -1
    
    choice = menu('Choose an option:',  'Load Data', 'Filter Data', 'Data Statistics', 'Generate Plots', 'Quit');
    
    %% error message for when you try to run some of the functions without loading data
    if fId == -1 && (choice == 2 || choice == 3 || choice == 4)
        disp('This path is unavailable. A snorlax is blocking your path. Come back when you have loaded some data');
        roadblock= imread('roadblock.jpg');
        image(roadblock);
    else
        
        
        %% main menu
        switch choice
            
            case 1
                %% Data Load
                filename = input('Input filename to load:', 's');
                
                fId = fopen(filename);
                
                if fId == -1
                    disp('404 file not found');
                    error = imread('error404.jpg');
                    image(error);
                else
                    data = dataLoad(filename);
                end
                
            case 2
                %% Filter
                disp('This option is unavailable at the moment');
                roadblock= imread('Bugs.jpg');
                image(roadblock);
                
            case 3
                %% Data Statistics
                
                sc = menu('Choose what statistic you would like to calculate', 'Mean Temperature', 'Mean Growth rate', 'Std temperature', 'Std Growth', 'Rows', 'Mean Cold Growth rate', 'Mean Hot Growth rate', 'Back')
                
                if sc == 1
                    statistic = 'Mean Temperature';
                    
                elseif sc == 2
                    
                    statistic = 'Mean Growth rate';
                    
                elseif sc == 3
                    
                    statistic = 'Std Temperature';
                    
                elseif sc == 4
                    
                    statistic = 'Std Growth rate';
                    
                elseif sc == 5
                    
                    statistic = 'Rows';
                    
                elseif sc == 6
                    
                    statistic = 'Mean Cold Growth rate';
                    
                elseif sc == 7
                    statistic = 'Mean Hot Growth rate';
                    
                else
                    disp('invalid choice')
                end
                
                dataStatistics(data, statistic)
            case 4
                %% Generate Plots
                
                disp('Sorry. Jonathan was crucified before he could finish the function')
                christ = imread('Christ.jpg');
                image(christ);
                
            case 5
                
                %% Quit (ends the while loop)
                
                quitId = 1;
        end
    end
    
end
disp('success!')
clear