
% Initialise
fId = -1;
rngFiltPrompt = [' '];
BacType= [' '];
rngFiltId = 0;
bacFiltId = 0;

while true
    %menu
    choice = menu('Choose an option:',  'Load Data', 'Filter Data', 'Data Statistics', 'Generate Plots', 'Quit');
   

     %Filter warning Dialogue box
    
     if rngFiltId == 1 || bacFiltId == 1
    
    msgbox({'The data has the current filters:' rngFiltPrompt upper(BacType)})
    
     end
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
                
                % id to check if there was a file loaded
                fId = fopen(filename);
                
                %looks for the type of file
                [~, ~, filetype] = fileparts(filename);
                %this if statement is to stop you from loading files that
                %can't be found or non .txt files
                if fId == -1
                    disp('404 file not found');
                    
                    
                elseif strcmp(filetype, '.txt') == false
                    disp('404 wrong filetype \n Can only Load .txt files.')
                
                   
                else
                    %Load the file. It also removes invalid data sets
                    data = dataLoad(filename);
                    OldData = data;
                end
                
            case 2
                    %% Filter

                InOp=true;
                
                while InOp == true
                    InOp=false;
                    
                    % Vælg hvad der skal filtreres
                    Filter = input('Please type "BacteriaType", "Growth rate" or "No filter" depending on what you wish to filter: ','s');
                    
                    % Bakterie sortering
                    if strcmpi(Filter,'bacteriatype')
                        BacType = input('Please enter the bacteria type you wish to work with: ','s');
                        if strcmp(lower(BacType),'salmonella enterica')
                            sal = data{:,3} == 1;
                            data=data(sal,:);
                            bacFiltId = 1;
                        elseif strcmp(lower(BacType),'bacillus cereus')
                            bac = data{:,3} == 2;
                            data=data(bac,:);
                            bacFiltId = 1;
                        elseif strcmp(lower(BacType),'listeria')
                            lis = data{:,3} == 3;
                            data=data(lis,:);
                            bacFiltId = 1;
                        elseif strcmp(lower(BacType),'brochothrix thermosphacta')
                            bro = data{:,3} == 3;
                            data=data(bro,:);
                            bacFiltId = 1;
                        else
                            disp('Invalid option');
                            InOp = true;
                        end
                        
                        % Growth rate sortering
                    elseif strcmp(lower(Filter),'growth rate')
                        gmin = str2double(input('Please enter the minimum growth rate: ','s'));
                        gmax = str2double(input('Please enter the maximum growth rate: ','s'));
                        
                        if isnan(gmin) || isnan(gmax)
                            disp('Invalid range. Range must be numeric.')
                            InOp = true;
                            
                        else
                            if gmin > gmax
                                gnu=gmax;
                                gmu=gmin;
                                gmin=gnu;
                                gmax=gmu;
                                
                            end
                            % For små data frasorteres
                            grate = data{:,2} > gmin;
                            data=data(grate,:);
                            
                            % For store data frasorteres
                            grate = data{:,2} < gmax;
                            data = data(grate,:);
                            % Range filter Id
                            rngFiltId = 1;
                            rngFiltPrompt = ['Growth Range from:' num2str(gmin) ' to ' num2str(gmax)];
                            
                        end
                        % Alle filtre slås fra
                    elseif strcmp(lower(Filter),'no filter');
                        data = OldData;
                        rngFiltId = 0;
                        bacFiltId = 0;
                        BacType = [' '];
                       
% Hvis bruger ikke indtaster rigtigt
                    else
                        disp('Invalid option');
                        InOp = true;
                        % Afslut det store if-statement
                    end
                    % Afslut while-statement
                end
                
            case 3
                %% Data Statistics
                % A menu that decides the statistic
                sc = menu('Choose what statistic you would like to calculate', 'Mean Temperature', 'Mean Growth rate', 'Std temperature', 'Std Growth', 'Rows', 'Mean Cold Growth rate', 'Mean Hot Growth rate','Back');
                
                % A simple if statement. all outcomes runs the function dataStatistics(data, statistic). 
                if sc == 1
                    statistic = 'Mean Temperature';
               
                  disp([statistic,'=',num2str( dataStatistics(data, statistic))]);
                elseif sc == 2
                    
                    statistic = 'Mean Growth rate';
                    disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 3
                    
                    statistic = 'Std Temperature';
                   disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 4
                    
                    statistic = 'Std Growth rate';
                    disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 5
                    
                    statistic = 'Rows';
                    disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 6
                    
                    statistic = 'Mean Cold Growth rate';
                    disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 7
                    statistic = 'Mean Hot Growth rate';
                    disp([statistic,'=',num2str( dataStatistics(data, statistic))])
                elseif sc == 8
                %back. It doesn't do anything.

                else
                    disp('invalid choice')
                end
                
            case 4
                %% Generate Plots
                dataPlot(data);
                
            case 5
                
                %% Quit (ends the while loop)
                
                break
        end
    end
    
end
disp('success!')
