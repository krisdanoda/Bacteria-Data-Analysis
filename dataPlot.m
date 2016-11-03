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
figure;
str1 = 'Salmonella enterica';
str2 = 'Bacillus cereus';
str3 = 'Listeria';
str4 = 'Brochothrix thermosphacta';
y=[s,bc,L,bt]
x={str1 str2 str3 str4}
x=[1:4];
h=bar(x,y)
title('Antal af hver bakterietype');
xlabel('Bakterietype')
ylabel('Antal bakterier')

l = cell(1,4);
l{1}=str1; l{2}=str2; l{3}=str3; l{4}=str4;    
set(gca,'xticklabel', l) 

%% Filter 
OldData=data;


        sal = data{:,3} == 1;
        datasal=data{sal,:};
        datasal=datasal(:,1:2);
        datasal=sortrows(datasal,1)
        bac = data{:,3} == 2;
        databac=data{bac,:};
        databac=databac(:,1:2);
        databac=sortrows(databac,1)
        lis = data{:,3} == 3;
        datalis=data{lis,:};
        datalis=datalis(:,1:2);
        datalis=sortrows(datalis,1)
        bro = data{:,3} == 4;
        databro=data{bro,:};
        databro=databro(:,1:2);
        databro=sortrows(databro,1)

figure;
plot(datasal(:,1),datasal(:,2),'g')
hold on
plot(databac,'r')
hold on
plot(datalis,'b')
hold on
plot(databro,'k')

datasal
datalis
databac
databro
% Afslut if-statement    
end