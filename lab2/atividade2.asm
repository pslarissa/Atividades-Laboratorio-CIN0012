	lw x10, a          
    lw x11, b         
    lw x12, m          

    bge x11, x12, else  # Se b >= m vai para 'else'

    add x12, x10, x11    # if (b < m): m = a + b
    beq x0, x0, end   # Pula para o 'end' 

else:
    sub x12, x10, x11    # if (b >= m): m = a - b

end:
    sw x12, m          # salva m 
    halt

a: .word 25
b: .word 12
m: .word 0x0
