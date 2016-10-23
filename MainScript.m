
choice = menu ('Choose an option','Load Data', 'Data Statistics',  'Plot data');

disp(choice)

switch choice
    %%Load Data
    case 1
        file = input('Enter File Name', 's')
        dataLoad(file)
    % Statistics
    case 2
        
    % Plot Graph
    case 3
    
 end