function [ noisy_data_1,noisy_data_2] = add_noise_1(tx_vector_1, tx_vector_2)
%snrdB = SNR(k);
%snr = 10 ^ (snrdB/10);
snrdB = 5;
noisy_data_1 = awgn(tx_vector_1, snrdB);
%noisy_data_1= tx_vector_1;
%noisy_data_2 = tx_vector_2;
noisy_data_2 = awgn(tx_vector_2, snrdB);

end