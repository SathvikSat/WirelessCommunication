%%Data Scrambling
function [data_scrambled, PN_] = data_scrambler_1(data_bits)

 %  128 bits of data
 
PN_seq = commsrc.pn('GenPoly', [1 1 0 1 0 1 1 0 1 0], 'InitialStates', [1 0 1 0 1 1 0 1 0], 'CurrentStates' ,[1 0 1 0 1 1 0 1 0], 'NumBitsOut', 1024); 
% change the number of bits in PN_seq
PN_ = PN_seq.generate;
data_scrambled = xor(data_bits ,PN_.'); %scrambed data; length = 128 bits

end 