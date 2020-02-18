clear all;

%part I
%{
%EGR 257 LAB5
alpha = 0;
beata = 0;
T = 100:1000;
Eg0 = 0;
Egt = 0;




%Germanium
Eg0 = 0.7437;
alpha = 4.77*10^(-4);
beta = 253;

%formula
Egt = Eg0 - (T.*T) .*(alpha./(T+beta));
figure
plot(T,Egt)
fprintf("Germanium\n")
fprintf("Energy bandgap at 300K")
Egt(200)
fprintf("Energy bandgap at 400K")
Egt(300)
fprintf("Energy bandgap at 600K")
Egt(500)


%Silicon
Eg0 = 1.166;
alpha = 4.73*10^(-4);
beta = 636;

%formula
Egt = Eg0 - (T.*T) .*(alpha./(T+beta));
figure
plot(T,Egt)
fprintf("Silicon\n")
fprintf("Energy bandgap at 300K")
Egt(200)
fprintf("Energy bandgap at 400K")
Egt(300)
fprintf("Energy bandgap at 600K")
Egt(500)

%GaAs
Eg0 = 1.519;
alpha = 5.41*10^(-4);
beta = 204;

%formula
Egt = Eg0 - (T.*T) .*(alpha./(T+beta));
figure
plot(T,Egt)
fprintf("GaAs\n")
fprintf("Energy bandgap at 300K")
Egt(200)
fprintf("Energy bandgap at 400K")
Egt(300)
fprintf("Energy bandgap at 600K")
Egt(500)

%}



%%Second part
q = 1.602*10^(-19);
E = linspace(-2,2,100);
E = E*q;
Mn_astrick = 1.08*(9.109*10^(-31)); %effective mass of electron
h = 6.63*10^(-34); %planks constant
Ec = 1.1*q; 
Ev = 0;
Mp_astrick = 0.8*(9.109*10^(-31));
KT = .0259*q;
Ef = 0.5*q;

        
NcE = ( (8* pi * sqrt(2)) / (h^3) )* (Mn_astrick^(3/2))*(sqrt(E-Ec));
NvE = ( (8* pi * sqrt(2)) / (h^3) )* (Mp_astrick^(3/2))*(sqrt(Ev-E)); 


fE = 1 ./ ( 1 + exp((E - Ef)./(KT)));


NcE = real(NcE);
NvE = real(NvE);
fE = real(fE);

%{
plot(NcE,E)
hold on
plot(NvE,E)
hold off
%}

%Probability of a electron occupying an available energy E:
plot(E)
%hold on
%hold off
%creating a horizontal line to represent the initial fermilevel(Ef) at.5eV
 

%{
%Probability of a hole occupying an available energy E:
plot(1-fE,E)
%}