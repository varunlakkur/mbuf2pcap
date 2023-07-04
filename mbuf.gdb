#Usage mbuf2hex <mbuf> <offset-from-the-beginning-of-the-pkt>
# Example:
# - If ether header is stripped, pass the offset as 14
# - If ether and ip header are stripped, pass the offset as 14 + ip header length(20)
define mbuf2hex
    set $_mb = (struct mbuf *)$arg0
    set $_offset = $arg1
    shell rm -f /tmp/mbuf-pktdump.bin
    while ($_mb != 0)
        append binary memory /tmp/mbuf-pktdump.bin $_mb->mh_data-$_offset $_mb->mh_data+$_mb->mh_len+$_offset
        set $_offset = 0
        set $_mb = $_mb->mh_next
    end
    shell xxd -g1 /tmp/mbuf-pktdump.bin
    shell rm -f /tmp/mbuf-pktdump.bin
end
