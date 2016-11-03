function data = dataLoad(filename)

    table = readtable(filename);

    % find temperetures outside of range

    tindex = table{:,1}>60 | table{:,1}<10;

    table(tindex,:)

    % find invalid Growth rate

    gindex = table{:,2}<0;

    table(gindex,:)

    % find invalid bacteria type

    bindex = table{:,3}>4 | table{:,3}<1;

    table(bindex,:)

    % remove all invalid data

    index = table{:,1} < 60 & table{:,1} > 10 & table{:,2} >= 0 & table{:,3} <= 4 & table{:,3} >= 1;

    data = table(index,:);

    
end