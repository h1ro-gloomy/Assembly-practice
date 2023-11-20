import pefile
import sys
pe = pefile.PE(sys.argv[1])
for section in pe.sections:
 print "%s %s %s %s" % (section.Name,
 hex(section.VirtualAddress),
 hex(section.Misc_VirtualSize),
 section.SizeOfRawData)
print "\n"