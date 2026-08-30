#PSEUDO-CODIGO: 
#int f;
#int g;
#int h;
#inf i;
#int j;
#if (i == j){
#	f = g + h,
#}else{
#	f = g - h
#}

lw x19, f
lw x20, g
lw x21, h
lw x22, i
lw x23, j

bne x22, x23, else # se i != j >> vai para o else 

add x19, x20, x21 # se i == j >> f = g + h
beq x0, x0, end # instrução que compara e pula para a saida

else: 
sub x19, x20, x21 

end: 
sw x19, f
halt

f: .word 0x0
g: .word 2
h: .word 4
i: .word 6
j: .word 6



