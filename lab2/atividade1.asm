lw x10, a  	#x10 = a
lw x11, b	#x11 = b 
lw x12, m	#x12 = m
add x12, x10, x0 # m = a (a + 0)
bge x11, x12, end #compara de b >=m, se for verdadeiro, ele pula para a 'marcacao' "END"
add x12, x10, x11 # m = a + b (só funciona se a condição anterior não for verdadeira)
end:
sw x12, m #salva m e encerra
halt
a: .word 0xE
b: .word 0x7
m: .word 0x0
