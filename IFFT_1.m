   %% IFFT N = 256
%frame1 = [data_mod.', zeros(1,7)];
%frame2 = [zeros(1,7), flip(data_conj.')];
%frame = [frame1, frame2];
function [tx_cp, tx_cp2] = IFFT_1(qam_symbols_mod_1, qam_symbols_mod_2)
qam_symbols_mod_1 = qam_symbols_mod_1.';
qam_symbols_mod_2 = qam_symbols_mod_2.';

i=1;
tx_1 = zeros(256,5);
%while i <= 1025
    for p= 1:5
        
            tx_1(:, p) = (qam_symbols_mod_1(i:255+i));
            i = i+256;
    end

%tx_Nmultiplied = N.* tx_;
%end
N  = 16;
tx_1 = tx_1 *1;
tx_ = ifft(tx_1);
tx_  = N * tx_;
tx_cp1 = zeros(272,5);
for q =  1:5
    tx_cp1(:, q)  = [flip(tx_((241:256),q)); tx_(:,q)];
end
%tx_cp1 = [flip(tx_(49:64)),tx_];
tx_cp = tx_cp1(:);



%%
i=1;
tx_2 = zeros(256,5);
%while i <= 1025
    for p= 1:5
        
            tx_2(:, p) = (qam_symbols_mod_2(i:255+i));
            i = i+256;
    end

%tx_Nmultiplied = N.* tx_;
%end
N  = 16;
tx_2 = tx_2 *1;
tx_2t = ifft(tx_2);
tx_2t  = N * tx_2t;
tx_cp2 = zeros(272,5);
for q =  1:5
    tx_cp2(:, q)  = [flip(tx_2t((241:256),q)); tx_2t(:,q)];
end
%tx_cp1 = [flip(tx_(49:64)),tx_];
tx_cp2 = tx_cp2(:);

end