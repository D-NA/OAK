global main

section .data
    filename    db      "new folder", 0
    ;hello		db		"Hello, Dhanu!", 10, 0
    ;update		db		"Ilkom IPB", 10 ,0
    ;rename		db		"dhanu.txt", 0

section .bss
    fd          dd      1
    ;buffer      db      52

section .text
    main:
                ; err = mkdir(path, mode)
                mov		eax, 39
                mov 	ebx, filename
                mov		ecx, 6440
                int     0x80  
                mov		[fd], eax

                ; close(fd)
                mov     eax, 6
                mov     ebx, [fd]
                int     0x80
                
                ; exit(0)
                mov     eax, 1
                mov     ebx, 0
                int     0x80



