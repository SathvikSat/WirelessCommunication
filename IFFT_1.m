%% IFFT N = 64
%frame1 = [data_mod.', zeros(1,7)];
%frame2 = [zeros(1,7), flip(data_conj.')];
%frame = [frame1, frame2];

function tx_cp = IFFT_1(data_mod)

tx_ = ifft(data_mod.');
%tx_Nmultiplied = N.* tx_;
tx_cp1 = [flip(tx_(49:64)),tx_];
tx_cp = tx_cp1.';

end