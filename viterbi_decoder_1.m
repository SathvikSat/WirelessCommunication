%%Viterbi decoder
function  rx_decoded = viterbi_decoder_1(data_encoded, trellis) 
tb = 25;
rx_decoded = vitdec(data_encoded, trellis, tb, 'trunc', 'hard');

end