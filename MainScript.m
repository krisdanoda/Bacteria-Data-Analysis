
%Initialisers
%File Id
fId = -1;
% Prompts and Ids for menu
OriginalPrompt = {'Choose an option:'};
Prompt = OriginalPrompt;
FiltId = 0;
while true
    %menu
    choice = menu(Prompt,  'Load Data', 'Filter Data', 'Data Statistics', 'Generate Plots', 'Quit');
    
    
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
                            
                            
                            % checks if there is a filter in place. Adds to the filter prompt in the
                            % menu
                            if FiltId == 0
                                Prompt{ length( Prompt ) +1 } = 'You are sorting with the current filters:';
                            end
                            % Adds the Bacteria type to filter
                            Prompt{ length( Prompt ) +1 } = 'Salmonella Enterica';
                            FiltId = 1;
                            
                        elseif strcmp(lower(BacType),'bacillus cereus')
                            bac = data{:,3} == 2;
                            data=data(bac,:);
                            
                            % checks if there is a filter in place. Adds to the filter prompt in the
                            % menu
                            if FiltId == 0
                                Prompt{ length( Prompt ) +1 } = 'You are sorting with the current filters:';
                            end
                            % Adds the Bacteria type to filter
                            Prompt{ length( Prompt ) +1 } = 'Bacillus Cereus';
                            FiltId = 1;
                            
                        elseif strcmp(lower(BacType),'listeria')
                            lis = data{:,3} == 3;
                            data=data(lis,:);
                            
                            % checks if there is a filter in place. Adds to the filter prompt in the
                            % menu
                            if FiltId == 0
                                Prompt{ length( Prompt ) +1 } = 'You are sorting with the current filters:';
                            end
                            % Adds the Bacteria type to filter
                            Prompt{ length( Prompt ) +1 } = 'Listeria';
                            FiltId = 1;
                        elseif strcmp(lower(BacType),'brochothrix thermosphacta')
                            bro = data{:,3} == 3;
                            data=data(bro,:);
                            
                            % checks if there is a filter in place. Adds to the filter prompt in the
                            % menu
                            if FiltId == 0
                                Prompt{ length( Prompt ) +1 } = 'You are sorting with the current filters:';
                            end
                            % Adds the Bacteria type to filter
                            Prompt{ length( Prompt ) +1 } = 'Brochothrix Thermosphacta';
                            FiltId = 1;
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
                            
                           % This part is for filter prompt in the menu
                           % If there is already a filter id doesn't do the
                           % following
                            if FiltId == 0

                                Prompt{ length( Prompt ) +1 } = 'You are sorting with the current filters:';
                            end
                            Prompt{length( Prompt ) +1 } = ['Growth Range from:' num2str(gmin) ' to ' num2str(gmax)];
                            
                        end
                        % Alle filtre slås fra
                    elseif strcmp(lower(Filter),'no filter');
                    % returns the data to the old data    
data = OldData;
                    % returns the filter prompts to original state
                        FiltId = 0;
                        Prompt = OriginalPrompt;
                        
                       
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
