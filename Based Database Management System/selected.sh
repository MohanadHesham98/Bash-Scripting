selected() {

    while true
    do
        read -p "Enter table name: " table
        if [[ ! -f $table ]]; then
            echo "Table '$table' does not exist."
            echo "--------------------------------"
            continue
        fi
        echo "Now you are in '$table'"
        echo "--------------------------------"

        # Read the first line (column names)
        first_line=$(head -n 1 "$table")
        columns=()
        for col in $first_line; do
            columns+=("$col")
        done

        echo -e "\nSelect a column to view:"
        j=1
        for (( i=0; i<${#columns[@]}; i++ )); do
            echo "($j) ${columns[$i]}"
            ((j++))
        done

        read -p "Select one: " value
        value=$((value - 1))
        # Validate the selected column number
        if [[ $value -ge 0 && $value -lt ${#columns[@]} ]]; then
            selected_col=${columns[$value]}
            echo "You selected column: $selected_col"
        else
            echo "Invalid selection!"
            continue
        fi

        # Display values for selected column
        echo -e "\nValues under column '$selected_col':"
        tail -n +1 "$table" | while IFS= read -r line; do
            # Use space as the default delimiter
            row=($line)
            echo "${row[$value]}"
        done
        read -p "do you want to select more [y/n]: " value
        if [[ $value =~ [yY] ]]; then
            continue
        else
            break
        fi        
    done
}
