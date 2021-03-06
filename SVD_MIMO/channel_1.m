% channel effect

function  [tx_vector_1, tx_vector_2] = channel_1(tx_cp, tx_cp2)

L = 1; %Channel Taps
%h = zeros(1, N-L+1);


h_unpad_11 = (1/sqrt(2)) * (randn(L, 1) + 1i * randn(L, 1));
%h_unpad_1 = 1;

%h_pad_11_12 = h_pad_11 + h_pad_12;


h_unpad_12 =  (1/sqrt(2)) * (randn(L, 1) + 1i * randn(L, 1));
h_unpad_21 = (1/sqrt(2)) *(randn(L, 1) + 1i * randn(L, 1));
h_unpad_22 = (1/sqrt(2)) *(randn(L, 1) + 1i * randn(L, 1));
%h_unpad_2 = 1;

% Circular Convolution %h11 path

%h_unpad_11 = 1;
%h_unpad_12 = 1;
%h_unpad_21 = 1;
%h_unpad_22 = 1;

%channel_faded_data_y1 =  conv(h_unpad_11, tx_cp) + conv(h_unpad_12, tx_cp2);
%channel_faded_data_y2 =  conv(h_unpad_21, tx_cp) + conv(h_unpad_22, tx_cp2);

%%
%SVD

H_assumed = [h_unpad_11 h_unpad_12; h_unpad_21 h_unpad_22];

[U S V] = svd(H_assumed);


%tx_vector = [tx_cp; tx_cp2];


tx_cp_intermediate_1 = (V(1,1) * tx_cp) + (V(1,2) * tx_cp2) ; 
tx_cp_intermediate_2 = (V(2,1) * tx_cp) + (V(2,2) * tx_cp2) ;


%tx_vector_intermediate = [tx_cp_intermediate_1; tx_cp_intermediate_2];

H_at_tx = [h_unpad_11 h_unpad_12; h_unpad_21 h_unpad_22];

tx_vector_1 = (H_at_tx(1,1) * tx_cp_intermediate_1) + (H_at_tx(1,2)* tx_cp_intermediate_2);
tx_vector_2 = (H_at_tx(2,1) * tx_cp_intermediate_1) + (H_at_tx(2,2)* tx_cp_intermediate_2);

%tx_vector = [tx_vector_1; tx_vector_2];


end
