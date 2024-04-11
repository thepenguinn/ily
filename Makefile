ily.hex: ily.ihx
	packihx ily.ihx > ily.hex

ily.ihx: ily.asm
	sdas8051 -los ily.asm
	sdld -i ily

# ucsim_51 -b ily.hex
