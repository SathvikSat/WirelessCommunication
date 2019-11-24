%% QAM Demodulation

function rx_binary = deQAM_1(rx_with_qam)

rx_without_qam = qamdemod(rx_with_qam, 16);
rx_binary_64x4 = de2bi(rx_without_qam);
rx_binary = reshape(rx_binary_64x4,1,256);

end