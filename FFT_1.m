%% Fast Fourier Transform

function rx_with_qam = FFT_1(rx_data_with_noise)

rx_without_cp = rx_data_with_noise(17:272);
rx_with_qam  = fft(rx_without_cp);

end