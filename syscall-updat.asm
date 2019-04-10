global main

section .data
    filename    db      "test.txt", 0
    ;hello		db		"Hello, Dhanu!", 10, 0
    update		db		"Ilkom IPB", 10 ,0

section .bss
    fd          dd      1
    ;buffer      db      52

section .text
    main:
                ; fd = open(filename, flags)
                mov     eax, 5
                mov     ebx, filename
                mov     ecx, 2
                int     0x80
             
                mov     [fd], eax	; simpan hasil return
                
                ;; offs = lseek(fd, offset, whence)  //Reposisi pointer read/write
                mov     eax, 19
                mov     ebx, [fd]
                ;mov     ecx, 0
                mov		edx, 2
                int     0x80
                
                ; write(fd, buffer, count)
                mov     eax, 4
                mov     ebx, [fd]                      ; 1 = stdout
                mov     ecx, update
                mov     edx, 10
                int     0x80               

                ; close(fd)
                mov     eax, 6
                mov     ebx, [fd]
                int     0x80
                
                ; exit(0)
                mov     eax, 1
                mov     ebx, 0
                int     0x80
