%%Data Scrambling
data_bits = round(rand(1,128));

PN_seq = commsrc.pn('GenPoly', [1 1 0 1 0 1 1], 'InitialStates', [1 0 1 0 1 1], 'CurrentStates' ,[1 0 1 0 1 1], 'NumBitsOut', 128);
PN_ = PN_seq.generate;
data_modified = xor(data_bits ,PN_.');

%% Convolution Encoding 
trellis = poly2trellis(5, [37 33]);
data_encoded = convenc(data_modified, trellis);


%% 4 - QPSK modulatation/ 16 - QAM

data_reshape  = reshape(data_encoded, 64,4);
data_deci = bi2de(data_reshape);
data_mod = qammod(data_deci , 16);
%scatterplot(data_mod);
%data_conj = conj(data_mod);
%%
%circ shift N/2
N = 64;
data_mod_circshift = circshift(data_mod,N/2);
 




%%
%frame1 = [data_mod.', zeros(1,7)];
%frame2 = [zeros(1,7), flip(data_conj.')];
%frame = [frame1, frame2];
tx_ = ifft(data_mod_circshift.');
tx_Nmultiplied = N.* tx_;
tx_cp1 = [tx_Nmultiplied(49:64),tx_];
tx_cp = tx_cp1.';

%%
L = 16; %channel taps
%h = zeros(1, N-L+1);
%h = rand()
%h = zeros(1, N+);
h_unpad = randn(L, 1) + 1i * randn(L, 1);
h_pad = [h_unpad; zeros(64,1)];
h_pad = [1; zeros(79, 1)];
%% Circular Convolution
y_ =  cconv(h_pad, tx_cp, length(tx_cp));

%AWGN Noise 
snrdB = 18; snr = 10 ^ (snrdB/10);
rx_data_with_noise = y_; %awgn(y_, snrdB);
%% Cyclic prefix removal

rx_without_cp = rx_data_with_noise(17:80);
%% Fast Fourier Transform
rx_with_qam  = fft(rx_without_cp)./N;


%% QAM Demodulation
rx_without_qam = qamdemod(rx_with_qam, 16);
rx_binary_4 = de2bi(rx_without_qam);
rx_binary = reshape(rx_binary_4,1,256);


sum(bitxor(rx_binary(:), data_encoded(:)))


