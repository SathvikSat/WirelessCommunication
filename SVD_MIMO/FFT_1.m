%% Fast Fourier Transform

function [rx_with_qam_1, rx_with_qam_2] = FFT_1(noisy_data_1, noisy_data_2)

rx_without_cp_1 = zeros(256,5);
k=1;

    for q = 1:5
            rx_without_cp_1(:,q) = noisy_data_1(k+16:271+k);
            k = k+272;
    end
N = 16;    
rx_without_cp_1;
%rx_without_cp = rx_data_with_noise(17:80);
rx_with_qam_1_y1 = fft(rx_without_cp_1);
rx_with_qam_1_y1 = (1/N) * rx_with_qam_1_y1;

%rx_with_qam_1 = zeros(256,5);
%    for p= 1:5
        
 %           rx_with_qam_1(:, p) = fft(rx_without_cp(:, p));
 %   end
rx_with_qam_1 = rx_with_qam_1_y1(:);%convert to a single column
%tx_Nmultiplied = N.* tx_;





%% for h21 and h22 i.e h21+h22 
rx_without_cp_2 = zeros(256,5);
k=1;

    for q = 1:5
            rx_without_cp_2(:,q) = noisy_data_2(k+16:271+k);
            k = k+272;
    end
N = 16;    
rx_without_cp_2;
%rx_without_cp = rx_data_with_noise(17:80);
rx_with_qam_1_y2 = fft(rx_without_cp_2);
rx_with_qam_1_y2 = (1/N) * rx_with_qam_1_y2;
%rx_with_qam_1 = zeros(256,5);
%    for p= 1:5
        
 %           rx_with_qam_1(:, p) = fft(rx_without_cp(:, p));
 %   end
rx_with_qam_2 = rx_with_qam_1_y2(:);%convert to a single column
%tx_Nmultiplied = N.* tx_;
end

