
% code for genarate the parameter set for finite difference model of BMP
% signaling in blastula stage model of zebrafish embryo

% By Linlin Li 

set_number = 20; % set number for parallel computering 
set_case = 5000; % parameter cases in ezch set

for j=1:set_number
 sprintf (['paramter generating is set ' num2str(j)])
n=set_case;
parameter_sets=zeros(13,n);
for i=1:n
    
p_DN_DBC_DBN=logspace(-2,2,10000);%5;%
p_decN_BC_BN=logspace(-5,-1,10000);%10^-4;%
p_J=logspace(-2,2,10000);%10;%
p_Tld_deg=logspace(-4,0,10000);%20;%
p_kon_koff=logspace(-4,0,100000);%10^-2;%

%parameters.DB = 4.4; %p_DN_DBC_DBN(randi([1,length(p_DN_DBC_DBN)],1,1));        %4.4;                            % diffusion rate of ligand (BMP)    ?m2/s
%parameters.DC = 7; 
rng('shuffle'); % shuffle the seed for Monte Carlo method
parameters.DN = p_DN_DBC_DBN(randi([1,length(p_DN_DBC_DBN)],1,1)); 
%rng('shuffle');% diffusion rate of Noggin          ?m2/s
parameters.DBC = p_DN_DBC_DBN(randi([1,length(p_DN_DBC_DBN)],1,1)); 
%rng('shuffle');% diffusion rate of [BMP,Chd]       ?m2/s
parameters.DBN = p_DN_DBC_DBN(randi([1,length(p_DN_DBC_DBN)],1,1)); 


parameters.k2   = p_kon_koff(randi([1,length(p_kon_koff)],1,1));
% binding rates for BMP ligand and Chordin          nM^-1*m^-1
%parameters.k_2  = parameters.k2; 

parameters.k3   = p_kon_koff(randi([1,length(p_kon_koff)],1,1));
% binding rates for BMP ligand and Noggin           nM^-1*m^-1
%parameters.k_3  = parameters.k3*0.1;

%parameters.decB = 8.7*10^-5;   % decay rate of Ligand (BMP)    nM*m^-1
%parameters.decC = 9.6*10^-5;   % decay rate of Chd             nM*m^-1
parameters.decN = p_decN_BC_BN(randi([1,length(p_decN_BC_BN)],1,1)); 
% decay rate of Nog             nM*m^-1
parameters.decBC = p_decN_BC_BN(randi([1,length(p_decN_BC_BN)],1,1));
% decay rate of BC             nM*m^-1
parameters.decBN = p_decN_BC_BN(randi([1,length(p_decN_BC_BN)],1,1));
% decay rate of BN             nM*m^-1
%%% production rates 
parameters.j1 = p_J(randi([1,length(p_J)],1,1));
% production rate of BMP          nM*m^-1 
parameters.j2 = p_J(randi([1,length(p_J)],1,1));
% production rate of Chordin      nM*m^-1
parameters.j3 = p_J(randi([1,length(p_J)],1,1));
% production rate of Noggin       nM*m^-1
%%% Tolloid behavior
parameters.lambda_tld_C = p_Tld_deg(randi([1,length(p_Tld_deg)],1,1));
% tld processing rate of Chd  nM^-1*m^-1
parameters.lambda_tld_BC =p_Tld_deg(randi([1,length(p_Tld_deg)],1,1));
% tld processing rate of LC   nM^-1*m^-1
parameters.tld_conc = 0.2; 
parameter_sets(:,i)=[parameters.DN;parameters.DBC;parameters.DBN;parameters.k2;parameters.k3;...
                     parameters.decN;parameters.decBC;parameters.decBN;parameters.j1;parameters.j2;parameters.j3;...
                     parameters.lambda_tld_C;parameters.lambda_tld_BC];

end
eval(['parameter_set' num2str(j) '=parameter_sets;']);

%% plot the paramter distribution 
% figure(1)
% scatter3(parameter_sets(1,:),parameter_sets(2,:),parameter_sets(3,:));
% hold on
% figure(2)
% scatter(parameter_sets(4,:),parameter_sets(5,:));
% hold on
% % figure(3)
% % scatter(parameter_sets(6,:),parameter_sets(7,:));
% % hold on
% figure(4)
% scatter3(parameter_sets(6,:),parameter_sets(7,:),parameter_sets(8,:));
% hold on
% 
% figure(5)
% scatter3(parameter_sets(9,:),parameter_sets(10,:),parameter_sets(11,:));
% hold on
% figure(6)
% scatter(parameter_sets(12,:),parameter_sets(13,:));
% hold on

end