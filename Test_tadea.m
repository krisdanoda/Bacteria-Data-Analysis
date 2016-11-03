% Filter 
OldData=dataLoad('test.txt');
data=OldData;
InOp=true;

while InOp == true
    InOp=false;

% Vælg hvad der skal filtreres
Filter = input('Please type "BacteriaType", "Growth rate" or "No filter" depending on what you wish to filter: ','s');

% Bakterie sortering
if strcmp(lower(Filter),'bacteriatype')
    BacType = input('Please enter the bacteria type you wish to work with: ','s');
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
        bro = data{:,3} == 3;
        data=data{bro,:};
    else 
        disp('Invalid option');
        InOp = true;
    end
    
% Growth rate sortering
elseif strcmp(lower(Filter),'growth rate')
    gmin = str2double(input('Please enter the minimum growth rate: ','s'));
    gmax = str2double(input('Please enter the maximum growth rate: ','s'));
    
    if isnan(gmin) || isnan(gmax) 
    disp('Invalid range')
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
    end
    
    
% Alle filtre slås fra
elseif strcmp(lower(Filter),'no filter');
data=OldData;


% Hvis bruger ikke indtaster rigtigt
else 
    disp('Invalid option');
    InOp = true;

    
% Afslut det store if-statement  
end

% Afslut while-statement
end
