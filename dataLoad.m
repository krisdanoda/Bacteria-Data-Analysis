function data = dataLoad(filename)
    % Initialise by loading data and replacing data names
    table = readtable(filename);
    table.Properties.VariableNames{'Var1'} = 'Temperature';
    table.Properties.VariableNames{'Var2'} = 'Growth';
    table.Properties.VariableNames{'Var3'} = 'Bacteria_Type';

    % find temperetures outside of range. iIndex is a boolean that finds
    % all shows the invalid temperatures
    
    tIndex = table{:,1}>60 | table{:,1}<10;
    if sum(tIndex) > 0
        display('Found invalid Temperature(s)')
        
        disp(table(tIndex,:))
        
        display('Press any key to continue:')
        pause
    end
    % find invalid Growth rate
    
    gIndex = table{:,2} < 0;
    
    if sum(gIndex) > 0
        display('Found invalid Growth Rate(s)')
        
        disp(table(gIndex,:))
        
        display('Press any key to continue:')
        pause
    end
    
    % find invalid bacteria type
    
    bIndex = ~(table{:,3} == 1 | table{:,3} == 2 | table{:,3} == 3 |  table{:,3} == 4);
    if sum(bIndex) > 0
        
        display('Found invalid bacteria indicator(s)')
        
        disp(table(bIndex,:))
        
        display('Press any key to continue:')
        pause
    end
 % remove all invalid data
    
    index = table{:,1} < 60 & table{:,1} > 10 & table{:,2} >= 0 & table{:,3} <= 4 & table{:,3} >= 1;
   
    data = table(index,:);


end