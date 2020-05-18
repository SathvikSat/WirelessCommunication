%% Convolution Encoding 
function [data_encoded,trellis] = cc_encoder_1(data_scrambled)

trellis = poly2trellis(5, [37 33]); % 5 is number of states, 37 and 33 are octal values for xor
data_encoded = convenc(data_scrambled, trellis); % convolutional encoding 


end 