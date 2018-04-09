#!/bin/bash
`/usr/bin/nasm -f elf -o $1.o $1.asm`
`/usr/bin/ld -o $1 -e main $1.o`
`rm $1.o`
