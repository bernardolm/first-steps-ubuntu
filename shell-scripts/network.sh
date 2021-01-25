PORTS_TO_ALLOW_IN_UFW=$(<$SYNC_PATH/scripts/ports-to-open-in-ufw.txt)

function reset_iptables() {
    CMDS=(ip6tables iptables)
    echo 'running for '${CMDS[@]}

    for p in ${CMDS[@]}; do
        echo 'running '$p'...'

        sudo $p -F
        sudo $p -F FORWARD
        sudo $p -F INPUT
        sudo $p -F OUTPUT
        sudo $p -P FORWARD ACCEPT
        sudo $p -P INPUT ACCEPT
        sudo $p -P OUTPUT ACCEPT
        sudo $p -t mangle -F
        sudo $p -t mangle -P FORWARD ACCEPT
        sudo $p -t mangle -P INPUT ACCEPT
        sudo $p -t mangle -P OUTPUT ACCEPT
        sudo $p -t mangle -P POSTROUTING ACCEPT
        sudo $p -t mangle -P PREROUTING ACCEPT
        sudo $p -t mangle -X
        sudo $p -t nat -F
        sudo $p -t nat -P OUTPUT ACCEPT
        sudo $p -t nat -P POSTROUTING ACCEPT
        sudo $p -t nat -P PREROUTING ACCEPT
        sudo $p -t nat -X
        sudo $p -X

        echo 'finish '$p
    done

    sudo ufw --force reset
    sudo ufw --force enable

    echo "restoring rules"

    for i in $PORTS_TO_ALLOW_IN_UFW; do
        echo "allowing $i"
        $(sudo ufw allow $i)
    done

    sudo ufw --force reload

    echo "listing simple updated rules"

    sudo ufw status numbered

    echo "listing verbose updated rules"
}

function setup_tunnel() {
    sleep 15s
    add_my_routes_to_vpn
}

function vpn_hu() {
    figlet "VPN" -f /usr/share/figlet/slant.flf
    # setup_tunnel &
    start_vpn
}
