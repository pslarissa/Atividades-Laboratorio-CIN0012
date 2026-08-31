addi x11, x0, 28 #guarda o endereço inicial da string
   
loop:
    lb   x10, 0(x11)
    beq  x10, x0, end   #se o caractere for 0, sai do loop
    sb   x10, 1024(x0) 
    addi x11, x11, 1    #passa pro proximo caractere na memória
    beq  x0, x0, loop    

end:
    halt

str1: .string "Hello World"
