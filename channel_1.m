% channel effect

function channel_faded_data = channel_1(tx_cp)
L = 16; %channel taps
%h = zeros(1, N-L+1);
%h = rand()
%h = zeros(1, N+);
h_unpad = randn(L, 1) + 1i * randn(L, 1);
h_pad = [h_unpad; zeros(64,1)];
%h_pad = [1; zeros(79, 1)];
%% Circular Convolution
channel_faded_data =  cconv(h_pad, tx_cp, length(tx_cp));


end
