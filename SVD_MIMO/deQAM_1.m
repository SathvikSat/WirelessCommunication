%% QAM Demodulation

function [rx_bits_1]  = deQAM_1(rx_with_qam_1, rx_with_qam_2)
indices = [1:1280];
pilot_indices = [8,250, 264, 506, 520, 762, 776, 1018, 1032, 1274 ];
data_indices  = setdiff(indices, pilot_indices);
%pilot_data = 1 + 1i ;

y_pilot_1 = rx_with_qam_1(pilot_indices);

% h_est_1 = y_pilot_1./pilot_data
% 
% y_data_1 = rx_with_qam_1(data_indices);
% 
% k=1; w=1; x=2;
% for i=1:5
%         x_data_1(:,i) = y_data_1(k:253+k)./((h_est_1(w)+h_est_1(x))/2);
%         k=k+254; w=w+2; x = x+2;
% end
% x_data_1 = x_data_1(:);
% rx_without_qam_1 = qamdemod(x_data_1, 256);
% rx_binary_1 = de2bi(rx_without_qam_1);
% 
% rx_bits_1 = zeros(10160,1);
% q=1;
% for m = 1:1270
%     for n = 1:8
%         rx_bits_1(q) = rx_binary_1(m,n);
%         q=q+1;
%     end
% end
% %rx_binary = reshape(rx_binary_64x4,1,256);
% rx_bits_1;
% %%
% 
% 
% 
% %indices = [1:1280];
% %pilot_indices = [8,250, 264, 506, 520, 762, 776, 1018, 1032, 1274 ];
% %data_indices  = setdiff(indices, pilot_indices);
% %pilot_data = 1 + 1i ;
% 
y_pilot_2 = rx_with_qam_2(pilot_indices);
% 
% h_est_2 = y_pilot_2./pilot_data
% 
% y_data_2 = rx_with_qam_2(data_indices);
% 
% k=1; w=1; x=2;
% for i=1:5
%         x_data_2(:,i) = y_data_2(k:253+k)./((h_est_2(w)+h_est_2(x))/2);
%         k=k+254; w=w+2; x = x+2;
% end
% x_data_2 = x_data_2(:);
% rx_without_qam_2 = qamdemod(x_data_2, 256);
% rx_binary_2 = de2bi(rx_without_qam_2);
% 
% rx_bits_2 = zeros(10160,1);
% q=1;
% for m = 1:1270
%     for n = 1:8
%         rx_bits_2(q) = rx_binary_2(m,n);
%         q=q+1;
%     end
% end
% %rx_binary = reshape(rx_binary_64x4,1,256);
% rx_bits_2;
% %%
% 
% 
y_pilot_mat = [y_pilot_1.'; y_pilot_2.'];
x_pilot_mat = [2+1i 3+4i 5+2i 1+4i 3+6i 2+4i 2+5i 7-2i 3+5i 2+3i; 2+1i 3+4i 3-8i 1+4i 3+6i 3+5i 2+5i 7-2i 3+5i 1+1i];
%x_pilot_mat = [2+1i 3+4i 5+2i 1+4i 3+6i 2+4i 2+5i 7-2i 3+5i 2+3i; 2+1i 3+4i 5+2i 1+4i 3+6i 2+4i 2+5i 7-2i 3+5i 2+3i ];
%%
%estimation of h11+h12 and h22+h21
X_Xt = x_pilot_mat * x_pilot_mat'; % Least Square Equation for estimation of Channel State Information (CSI) H = YX' .* inv(XX')
Y_Xt_for_h1 = y_pilot_mat * x_pilot_mat';

H_est =   Y_Xt_for_h1 * inv(X_Xt) ;
%Y / X
%H_est = y_pilot_mat / x_pilot_mat



H11_H12 = H_est(1,1) + H_est(1,2);
H21_H22 = H_est(2,1) + H_est(2,2);


%% Data Indicies received
 y_data_1 = rx_with_qam_1(data_indices);
 y_data_2 = rx_with_qam_2(data_indices); 

 
[U S V] = svd(H_est); 
U = U'; 
 
y_cap_1 = ( U(1,1) * y_data_1) + ( U(1,2) * y_data_2); 

y_cap_2 = ( U(2,1) * y_data_1) + ( U(2,2) * y_data_2);
 %%
rx_without_qam_1 = qamdemod(x_average, 256);
%rx_without_qam_2 = qamdemod(x_data_2, 256);

rx_binary_1 = de2bi(rx_without_qam_1);

rx_bits_1 = zeros(10160,1);
q= 1;
for m = 1:1270
    for n = 1:8
        rx_bits_1(q) = rx_binary_1(m,n);
        q = q + 1;
    end
end 
%rx_binary = reshape(rx_binary_64x4,1,256);
rx_bits_1;



% 
% rx_bits_2 = zeros(10160,1);
% q= 1;
% for m = 1:1270
%     for n = 1:8
%         rx_bits_2(q) = rx_binary_2(m,n);
%         q = q + 1;
%     end
% end 
% %rx_binary = reshape(rx_binary_64x4,1,256);
% rx_bits_2;
% 
% 
% 
% 
end