# Operands to multiply
.data
a: .word 0xBAD
b: .word 0xFEED

.text
main:   # Load data from memory
		la      t3, a
        lw      t3, 0(t3)
        la      t4, b
        lw      t4, 0(t4)
        
        # t6 will contain the result
        add		t6, x0, x0

        # Mask for 16x8=24 multiply
        ori		t0, x0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff

		# a * b[0:7]
		mv		t1, t4
		andi	t1, t1, 0xff
        mul		t2, t3, t1
		and		t2, t2, t0
        add		t6, t6, t2

		# a * b[15:8]
		mv		t1, t4
        srli	t1, t1, 8
		andi	t1, t1, 0xff
        mul		t2, t3, t1
		and		t2, t2, t0
		slli	t2, t2, 8
		add		t6, t6, t2

finish: addi    a0, x0, 1
        addi    a1, t6, 0
        ecall # print integer ecall
        addi    a0, x0, 10
        ecall # terminate ecall
