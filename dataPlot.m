function dataPlot(data)
s=0;
bc=0;
L=0;
bt=0;

%Grunden til at X ikke virkede før, at at når vi importerer data fra
%test.txt bliver det konverteret til 'table' format. Vi skal derfor først
%omkonvertere det til matrix/vektor format før vi kan bruge det i length
%funktionen og for funktionen.

X=data{:,3};
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
y=[s,bc,L,bt];
x={str1 str2 str3 str4};
x=[1:4];
h=bar(x,y);
title('Antal af hver bakterietype');
xlabel('Bakterietype')
ylabel('Antal bakterier')

l = cell(1,4);
l{1}=str1; l{2}=str2; l{3}=str3; l{4}=str4;    
set(gca,'xticklabel', l) ;

%% Filter 
OldData=data;


        sal = data{:,3} == 1;
        datasal=data{sal,:};
        datasal=datasal(:,1:2);
        datasal=sortrows(datasal,1);
        bac = data{:,3} == 2;
        databac=data{bac,:};
        databac=databac(:,1:2);
        databac=sortrows(databac,1);
        lis = data{:,3} == 3;
        datalis=data{lis,:};
        datalis=datalis(:,1:2);
        datalis=sortrows(datalis,1);
        bro = data{:,3} == 4;
        databro=data{bro,:};
        databro=databro(:,1:2);
        databro=sortrows(databro,1);

figure;
plot(datasal(:,1),datasal(:,2),'g');
hold on;
plot(databac(:,1),databac(:,2),'b');
hold on;
plot(datalis(:,1),datalis(:,2),'r');
hold on;
plot(databro(:,1),databro(:,2),'k');
xlabel('Temperature');
ylabel('Growth Rate');
title('Growth rate for Temperature of Bacteria');
vec=[]
l1=0
l2=0
l3=0
l4=0
if length(datasal)>0
    l1='Salmonella enterica'
    vec=[vec 'Salmonella enterica']
else l1=''
end
if length(databac)>0
    l2='Bacillus cereus'
    vec=[vec 'Bacillus cereus']
else l2=''
end
if length(datalis)>0
    l3='Listeria'
    vec=[vec 'Listeria']
else l3=''
end
if length(databro)>0
    l4='Brochothrix thermosphacta'
    vec=[vec 'Brochothrix thermosphacta']
else l4=''
end
vec

legend({vec}, 'location', 'south');

% Afslut if-statement    
end