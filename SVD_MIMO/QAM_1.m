%% 4 - QPSK modulatation/ 16 - QAM = 2 ^4 = 16; 16 constellation points
function [qam_symbols_mod, qam_symbols_mod_2] = QAM_1(data_encoded)

%data_reshape  = reshape(data_encoded, 64,4);
k= 1;
data_reshape = zeros(1270,8);
for p= 1:1270
    for q = 1:8
        data_reshape(p,q) = data_encoded(k);
        k = k+1;
    end
    
end
data_deci = bi2de(data_reshape);
data_mod = qammod(data_deci , 256);
%scatterplot(data_mod); % to plot the constellation
%data_conj = conj(data_mod); 
indices = [1:1280];
%pilot_indices = [8,250, 264, 506, 520, 762, 776, 1018, 1032, 1274 ];
pilot_indices = [8,250, 264, 506, 520, 762, 776, 1018, 1032, 1274];
data_indices  = setdiff(indices, pilot_indices);
%x_pilot_mat = [2+1i 3+4i 5+2i 1+4i 3+6i 2+4i 2+5i 7-21i 3+5i 2+3i; 2+1i 3+4i 5+2i 1+4i 3+6i 2+4i 2+5i 7-21i 3+5i 2+3i ];
pilot_data = 1 + 1i ;

qam_symbols_mod = zeros(1,1280);
qam_symbols_mod(pilot_indices) = pilot_data;
qam_symbols_mod(8) = 2+1i;
qam_symbols_mod(250) = 3+4i;
qam_symbols_mod(264) = 5+2i;
qam_symbols_mod(506) = 1+4i;
qam_symbols_mod(520) = 3+6i;
qam_symbols_mod(762) = 2+4i;
qam_symbols_mod(776) = 2+5i;
qam_symbols_mod(1018) = 7-2i;
qam_symbols_mod(1032) = 3+5i;
qam_symbols_mod(1274) = 2+3i;
qam_symbols_mod(data_indices) = data_mod;
qam_symbols_mod_2 = qam_symbols_mod;
qam_symbols_mod_2(264)= 3-8i;
qam_symbols_mod_2(762)= 3+5i;
qam_symbols_mod_2(1274)= 1+1i;


end