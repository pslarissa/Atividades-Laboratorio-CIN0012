addi x11, x0, 42 #42 em x11

loop:
    lb x10, 1025(x0)#Le o dado do endereço 1025
    beq x10, x11, end #Se o dado for 42 vai para o pro final 
    sb x10, 1024(x0) #Copia o dado pro endereço 1024
    jal x0, loop #repete o loop

end:
    halt 
