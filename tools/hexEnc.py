#!/usr/bin/python
import sys

string = sys.argv[1][::-1]
print("String: " + string[::-1])
print("String Length: " + str(len(string)))

print("Hex String:")
n=4
for i in range(0, len(string), n):
    print(string[i:i+n] + " - 0x" + string[i:i+n].encode("hex").zfill(8))
