%% TRANSMITTER PART

%% random message bits generation
total_bits = 128;
data_bits = round(rand(1,total_bits));

%% scrambling the data

[data_scrambled, PN_] = data_scrambler_1(data_bits);

%% encoding the data using convolutional encoder
[data_encoded, trellis] = cc_encoder_1(data_scrambled);

%% modulating the signal using 16QAM 
data_mod = QAM_1(data_encoded);

%% OFDM and adding cyclic prefix
tx_cp = IFFT_1(data_mod);

%% effect of channel fading co-efficient and addition of Additive White Gaussian Noise(AWGN) 
channel_faded_data = channel_1(tx_cp);
noisy_data = add_noise_1(tx_cp);

%% RECEIVER PART

%% OFDM
rx_with_qam = FFT_1(noisy_data);

%% Demodulation by deQAM
rx_binary = deQAM_1(rx_with_qam);

%% Decoding the signal using Viterbi Decoder
rx_decoded = viterbi_decoder_1(rx_binary, trellis);

%% Descramble the data
descrambler = descramble_1(PN_, rx_decoded);

%% No. of error bits calculation
error_bits = sum(bitxor(descrambler(:), data_bits(:)))
BER = error_bits / total_bits


 
