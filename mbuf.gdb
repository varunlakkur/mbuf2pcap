#Usage mbuf2hex <mbuf>
define mbuf2hex
    set $_mb = $arg0
    shell rm -f /tmp/mbuf-pktdump.bin
    while ($_mb != 0)
        append binary memory /tmp/mbuf-pktdump.bin $_mb->mh_data $_mb->mh_data+$_mb->mh_len
        set $_mb = $_mb->mh_next
    end
    shell xxd -g1 /tmp/mbuf-pktdump.bin
    shell rm -f /tmp/mbuf-pktdump.bin
end
