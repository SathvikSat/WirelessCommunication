function [ noisy_data_1,noisy_data_2] = add_noise_1(channel_faded_data_y1,channel_faded_data_y2)
%snrdB = SNR(k);
%snr = 10 ^ (snrdB/10);
snrdB = 5;
%noisy_data_1 = awgn(channel_faded_data_y1, snrdB);
noisy_data_1= channel_faded_data_y1;
noisy_data_2 = channel_faded_data_y2;
%noisy_data_2 = awgn(channel_faded_data_y2, snrdB);

end