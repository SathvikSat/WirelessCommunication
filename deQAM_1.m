%% QAM Demodulation

function rx_binary = deQAM_1(rx_with_qam)

rx_without_qam = qamdemod(rx_with_qam, 256);
rx_binary_256x8 = de2bi(rx_without_qam);
rx_binary = reshape(rx_binary_256x8,1,2048);

end