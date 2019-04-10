global main

section .data
    filename    db      "test.txt", 0
    ;hello		db		"Hello, Dhanu!", 10, 0
    ;update		db		"Ilkom IPB", 10 ,0

section .bss
    fd          dd      1
    ;buffer      db      52

section .text
    main:
                ; unlink -> err = unlink(path)
                mov		eax, 10
                mov 	ebx, filename
                int     0x80  

                ; close(fd)
                mov     eax, 6
                mov     ebx, [fd]
                int     0x80
                
                ; exit(0)
                mov     eax, 1
                mov     ebx, 0
                int     0x80

