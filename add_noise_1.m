function noisy_data = add_noise_1(tx_cp)
snrdB = 25; snr = 10 ^ (snrdB/10);
noisy_data = awgn(tx_cp, snrdB);

end