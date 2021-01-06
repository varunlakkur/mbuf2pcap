#Usage mbuf2hex <mbuf>
define mbuf2hex
    set $_mb = $arg0
    shell rm -f /tmp/mbuf-pktdump.bin
    while ($_mb != 0)
        append binary memory /tmp/mbuf-pktdump.bin $_mb->m_data $_mb->m_data+$_mb->m_len
        set $_mb = $_mb->m_next
    end
    shell xxd -g1 /tmp/mbuf-pktdump.bin
    shell rm -f /tmp/mbuf-pktdump.bin
end
