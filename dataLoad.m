function data = dataLoad(filename)
pwd
cd('C:\Users\Kristofer Pedersen\Documents\MATLAB\GitHub\Bacteria-Data-Analysis\Bacteria');

table = readtable(filename);
table=[table];

index = zeros(height(table),1);


% remove temperetures outside of range

tindex = table{:,1}>60 | table{:,1}<10;

table(tindex,:)

% remove invalid Growth rate

gindex = table{:,2}<0;

table(gindex,:)

% remove invalid bacteria type

bindex = table{:,3}>4 | table{:,3}<1;

table(bindex,:)

end