%% Filter 
OldData=data;

% Vælg hvad der skal filtreres
Filter = input('Please type "BacteriaType", "Growth rate" or "No filter" depending on what you wish to filter: ','s')

if strcmp(lower(Filter),'bacteriatype')
    BacType = input('Please enter the bacteria type you wish to work with: ','s')
    if strcmp(lower(BacType),'salmonella enterica')
        sal = data{:,3} == 1;
        data=data{sal,:};
    elseif strcmp(lower(BacType),'bacillus cereus')
        bac = data{:,3} == 2;
        data=data{bac,:};
    elseif strcmp(lower(BacType),'listeria')
        lis = data{:,3} == 3;
        data=data{lis,:}; 
    elseif strcmp(lower(BacType),'brochothrix thermosphacta')
        lis = data{:,3} == 3;
        data=data{lis,:};
    end
    
elseif strcmp(lower(Filter),'growth rate')
    
    
% Afslut if-statement    
end


