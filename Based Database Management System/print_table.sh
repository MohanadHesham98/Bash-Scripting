print_table() {
    table="$1"
    if [[ ! -f $table ]]; then
        echo "Table '$table' does not exist."
        break
    fi

    mapfile -t lines < "$table"

    declare -a col_widths

    for line in "${lines[@]}"; do
        IFS=' ' read -ra cols <<< "$line"
        for ((i = 0; i < ${#cols[@]}; i++)); do
            len=${#cols[i]}
            if [[ -z ${col_widths[i]} || $len -gt ${col_widths[i]} ]]; then
                col_widths[i]=$len
            fi
        done
    done

    echo
    for line in "${lines[@]}"; do
        IFS=' ' read -ra cols <<< "$line"
        for ((c = 0; c < ${#cols[@]}; c++)); do
            printf "%-${col_widths[c]}s | " "${cols[c]}"
        done
        echo
    done
    echo
}