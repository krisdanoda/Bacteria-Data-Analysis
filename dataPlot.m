function dataPlot(data)
s=0;
bc=0;
L=0;
bt=0;


X=data(:,3);
disp(X)
for i=1:length(X)
    if X(i)==1
        s = s+1;
    elseif X(i)==2
        bc=bc+1;
    elseif X(i)==3
        L=L+1;
    elseif X(i)==4
        bt=bt+1;
        end
end
y=[s,bc,L,bt]
x=[1:4];


end