%descrambler
function descrambler = descramble_1(PN_, rx_decoded)
descrambler = xor(PN_.' ,rx_decoded);
end