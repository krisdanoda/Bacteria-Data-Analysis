function data = dataLoad(filename)

%error message
fid = fopen(filename);
if fid == -1
    disp('404 file not found'); 
    error = imread('error404.jpg');
    image(error);
    
else
    table = readtable(filename);
    
    %replace number with bacteria names
    
    
    
    % find temperetures outside of range
    
    tindex = table{:,1}>60 | table{:,1}<10;
    display('Found invalid temperature(s)')
    
    table(tindex,:)
    
    display('Press any key to continue:')
    pause
    
    % find invalid Growth rate
    
    gindex = table{:,2} < 0;
    
    display('Found invalid Growth Rate(s)')
    
    table(gindex,:)
    
    display('Press any key to continue:')
    pause
    
    
    % find invalid bacteria type
    
    bindex = table{:,3}>4 | table{:,3}<1;
    
    table(bindex,:)
    
    display('Found invalid bacteria indicator(s)')
    
    table(bindex,:)
    
    display('Press any key to continue:')
    pause
   
 % remove all invalid data
    
    index = table{:,1} < 60 & table{:,1} > 10 & table{:,2} >= 0 & table{:,3} <= 4 & table{:,3} >= 1;
   
    data = table(index,:);
end
    

end