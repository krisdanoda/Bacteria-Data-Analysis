% Data statistics function 

function result = dataStatistics(data,statistic);

% T er temeratur vektor 
T=data{:,1};
% G er growth vektor
G=data{:,2};


% Den relevante statestik vælges og udregnes
switch statistic
    case 'Mean Temperature'
        result=mean(T);
        
    case 'Mean Growth rate'
        result=mean(G);
        
    case 'Std Temperature'
        result=std(T);
        
    case 'Std Growth rate'
        result=std(G);
        
    case 'Rows' 
        [result, ~]= size(T);
        
    case 'Mean Cold Growth rate'
        % Temp>20 fjernes
        G1=G(T<20)
        result=mean(G1)
        
        
    case 'Mean Hot Growth rate'
        % Temp<50 fjernes 
        G2=G(T>50)
        result=mean(G2)

% Afslut switch
end


% Afslut funktion
end
