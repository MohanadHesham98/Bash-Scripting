source "$SCRIPT_DIR/print_table.sh"

delete_table() {

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
        first_line=$(head -n 1 "$table")    # # id name age address header store them in first_line
        columns=()
        for col in $first_line; do          # # columns=("id" "name" "age" "address")
            columns+=("$col")
        done

        echo -e "\nSelect a column to view:"
        echo "--------------------------------"
        j=1
        for (( i=0; i<${#columns[@]}; i++ )); do
            echo "$j) ${columns[$i]}"
            ((j++))
        done

        read -p "Select one: " value
        value=$((value-1))
        # Validate the selected column number
        if [[ $value -ge 0 && $value -lt ${#columns[@]} ]]; then
            selected_col=${columns[$value]}
            echo "You selected column: $selected_col"
        else
            echo "Invalid selection!"
            echo "--------------------------------"
            continue
        fi

        # Display values for selected column
        echo -e "\nValues under column '$selected_col':"
        tail -n +2 "$table" | while IFS= read -r line; do
            row=($line)
            echo "${row[$value]}"
        done

        read -p "Enter value you want to delete: " data

        # Create temp file for updated content
        tmp_file=$(mktemp)

        # Add header to temp file
        echo "$first_line" > "$tmp_file"

        # Process each row
        tail -n +2 "$table" | while IFS= read -r line; do
            row=($line)
            if [[ "${row[$value]}" == "$data" ]]; then
                echo "Clearing value '$data' from row: $line"
                row[$value]="deleted_value"  # You can use "NULL" or " " if you want to indicate it more explicitly
            fi
            echo "${row[*]}" >> "$tmp_file"
        done

        # Replace the original file
        mv "$tmp_file" "$table"

        echo "Value '$data' has been deleted from the column '$selected_col'."
        echo "--------------------------------"
        print_table "$table"
        read -p "do you want to delete more [y/n]: " value
        if [[ $value =~ [yY] ]]; then
            continue
        else
            break
        fi        
    done
}