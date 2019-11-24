%% 4 - QPSK modulatation/ 16 - QAM = 2 ^4 = 16; 16 constellation points
function data_mod = QAM_1(data_encoded)

data_reshape  = reshape(data_encoded, 256,8);
data_deci = bi2de(data_reshape);
data_mod = qammod(data_deci , 256);
%scatterplot(data_mod); % to plot the constellation
%data_conj = conj(data_mod); 

end