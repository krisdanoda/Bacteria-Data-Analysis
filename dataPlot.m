function dataPlot(data)
s=0;
bc=0;
L=0;
bt=0;

%Grunden til at X ikke virkede før, at at når vi importerer data fra
%test.txt bliver det konverteret til 'table' format. Vi skal derfor først
%omkonvertere det til matrix/vektor format før vi kan bruge det i length
%funktionen og for funktionen.
%X=data(:,3);
X=data{:,3}
for i=1:length(X);
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

bar(x,y)

end