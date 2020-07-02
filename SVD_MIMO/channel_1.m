% channel effect

function [channel_faded_data_y1,channel_faded_data_y2] = channel_1(tx_cp, tx_cp2)

L = 1; %Channel Taps
%h = zeros(1, N-L+1);


h_unpad_11 = (1/sqrt(2)) * (randn(L, 1) + 1i * randn(L, 1));
%h_unpad_1 = 1;

%h_pad_11 = [h_unpad_1; zeros(1360-L,1)];
%h_pad_12 = [h_unpad_1; zeros(1360-L,1)];


%h_pad_11_12 = h_pad_11 + h_pad_12;


h_unpad_12 =  (1/sqrt(2)) * (randn(L, 1) + 1i * randn(L, 1));
h_unpad_21 = (1/sqrt(2)) *(randn(L, 1) + 1i * randn(L, 1));
h_unpad_22 = (1/sqrt(2)) *(randn(L, 1) + 1i * randn(L, 1));
%h_unpad_2 = 1;


%h_pad_21 = [h_unpad_2; zeros(1360-L,1)];
%h_pad_22 = [h_unpad_2; zeros(1360-L,1)];

%h_pad_21_22 = h_pad_21 + h_pad_22;
%h_pad = [1; zeros(1359, 1)];
% Circular Convolution %h11 path

%h_unpad_11 = 1;
%h_unpad_12 = 1;
%h_unpad_21 = 1;
%h_unpad_22 = 1;

channel_faded_data_y1 =  conv(h_unpad_11, tx_cp) + conv(h_unpad_12, tx_cp2);
channel_faded_data_y2 =  conv(h_unpad_21, tx_cp) + conv(h_unpad_22, tx_cp2);
%H_mat = [1, 1; 1, 1];
%Tx_CP = [tx_cp'; tx_cp2'];
%test = H_mat * Tx_CP;


end
