# mbuf2pcap
A simple native GDB script to dump an mbuf chain into hex dump. The hex dump can be directly imported into Wireshark to see the packet. Particularly useful to developers who deal with network packets in their code.

## Dependencies
* [xxd](https://linux.die.net/man/1/xxd)

## Installation
This is a standalone script. Just source this script into your `~/.gdbinit`
```
source <path-to-the-script>
```
## See the packet on Wireshark
* Copy the output into a file.
* Import the file in Wireshark with **File**>**Import from Hex Dump...**
