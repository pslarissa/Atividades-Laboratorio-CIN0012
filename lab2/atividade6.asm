
    addi x11, x0, 1          #1 acende o led
    addi x12, x0, 64         #limite
    sb x11, 1029(x0)         #acende o led 1 logo quando inicia

loop:
    lb x10, 1026(x0)         #lê o botão
    andi x10, x10, 0x1       #isola o bit do botão
    beq x10, x0, loop        #enquanto for 0, espera

#tratando debounce
ate_soltar:
    lb x10, 1026(x0)
    andi x10, x10, 0x1
    bne x10, x0, ate_soltar #enquanto for 1, espera soltar

    slli x11, x11, 1         #avança o bit pro led seguinte
    beq x11, x12, end        #se chegar no limite (64), vai direto para o fim

    sb x11, 1029(x0)         #só atualiza a saída se for um led válido
    jal x0, loop             #volta pra leitura do botão

end: halt                    #encerra a execução


