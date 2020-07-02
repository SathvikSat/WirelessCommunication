%%Viterbi decoder
function  [rx_decoded_1] = viterbi_decoder_1(rx_bits_1,  trellis) 
tb = 25;
rx_decoded_1 = vitdec(rx_bits_1, trellis, tb, 'trunc', 'hard');
%rx_decoded_2 = vitdec(rx_bits_2, trellis, tb, 'trunc', 'hard');

end