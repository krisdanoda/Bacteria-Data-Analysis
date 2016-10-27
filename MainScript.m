
% Initialise
fid = -1;
quit = -1;

while quit == -1

choice = menu('Choose an option:',  'Load Data','Filter Data', 'Data Statistics', 'Generate Plots', 'Quit')



switch choice 

    case 1
%% Data Load
filename = input('Input filename to load:', 's');

data = dataLoad(filename);

    case 2
%% Filter
disp('This path is unavailable. A snorlax is blocking your path');
roadblock= imread('roadblock.jpg');
image(roadblock);

    case 3
%% Data Statistics


 
    sc = menu('Choose what statistic you would like to calculate', 'Mean Temperature', 'Mean Growth rate', 'Std temperature', 'Std Growth', 'Rows', 'Mean Cold Growth rate', 'Mean Hot Growth rate')

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

%% Quit

quit= 1
end

end