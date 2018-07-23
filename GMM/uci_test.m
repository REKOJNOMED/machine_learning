function uci_test()
load uci.csv;
label=uci(:,5);
uci=uci(:,2:4);
[~,~,~,gama]=GMM_EM(7,uci);