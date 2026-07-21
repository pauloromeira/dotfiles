# ------------------------------ Utils ------------------------------ #
# Import wireguard config, set autoconnect to 'no' and disconnect

wg-import() {
    local output uuid

    output=$(nmcli connection import type wireguard file "$1")

    echo "$output"

    uuid=$(grep -oP "(?<=\()[0-9a-f-]+(?=\))" <<< "$output")

    nmcli connection modify "$uuid" connection.autoconnect no
    nmcli connection down "$uuid"
}
