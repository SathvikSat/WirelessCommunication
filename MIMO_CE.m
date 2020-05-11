
%% TRANSMITTER PART

%% random message bits generation
total_bits = 5080;
data_bits = round(rand(1,total_bits))


%% scrambling the data

%[data_scrambled, PN_] = data_scrambler_1(data_bits);
[data_scrambled, PN_] = data_scrambler_1(data_bits);



%% encoding the data using convolutional encoder
[data_encoded, trellis] = cc_encoder_1(data_scrambled);
% 10160 length
%% modulating the signal using 16QAM 
[qam_symbols_mod, qam_symbols_mod_2] = QAM_1(data_encoded);
%data_pilot = 1 + 1i ; 
%% OFDM and adding cyclic prefix
[tx_cp, tx_cp2] = IFFT_1(qam_symbols_mod, qam_symbols_mod_2);

%% effect of channel fading co-efficient and addition of Additive White Gaussian Noise(AWGN) 
[channel_faded_data_y1, channel_faded_data_y2] = channel_1(tx_cp, tx_cp2);

%channel_faded_data_y1  = tx_cp;
%channel_faded_data_y2 = tx_cp2;
%%
[noisy_data_1,noisy_data_2] = add_noise_1(channel_faded_data_y1,channel_faded_data_y2);
%% RECEIVER PART

%% OFDM
[rx_with_qam_1, rx_with_qam_2] = FFT_1(noisy_data_1, noisy_data_2);

%% Demodulation by deQAM
[rx_bits_1] = deQAM_1(rx_with_qam_1, rx_with_qam_2);
%% Decoding the signal using Viterbi Decoder
[rx_decoded_1] = viterbi_decoder_1(rx_bits_1, trellis);

%% Descramble the data
[descrambler_1] = descramble_1(PN_, rx_decoded_1);

%% No. of error bits calculation
data_bits_t = data_bits.';
error_bits_1 = sum(bitxor(descrambler_1(:), data_bits_t(:)))
%error_bits_2 = sum(bitxor(descrambler_2(:), data_bits_t(:)))

%%
BER_1 = error_bits_1 / total_bits
%BER_2 = error_bits_2 / total_bits
%%

 

