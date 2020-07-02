%descrambler
function [descrambler_1] = descramble_1(PN_, rx_decoded_1)
descrambler_1 = xor(PN_ ,rx_decoded_1);
%descrambler_2 = xor(PN_ ,rx_decoded_2);
end