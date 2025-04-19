source "$SCRIPT_DIR/print_table.sh"

update_table() {

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
        first_line=$(head -n 1 "$table")  # id name age address header
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
            echo "--------------------------------"
            continue
        fi

        # Display values for selected column
        echo -e "\nValues under column '$selected_col':"
        tail -n +2 "$table" | while IFS= read -r line; do
            row=($line)
            echo "${row[$value]}"
        done

        read -p "Enter value you want to update: " old_value
        read -p "Enter new value: " new_value
        
        # Create temp file for updated content
        tmp_file=$(mktemp)

        # Add header to temp file
        echo "$first_line" > "$tmp_file"

        # Process each row
        match_found=0
        while IFS= read -r line; do
            IFS=' ' read -r -a row <<< "$line"

            # If we found the old value and haven't updated yet
            if [[ $match_found -eq 0 && "${row[$value]}" == "$old_value" ]]; then
                echo "Updating row: $line"
                row[$value]="$new_value"
                match_found=1  # Prevent further updates
            fi

            # Add the updated (or unchanged) row to the temp file
            echo "${row[*]}" >> "$tmp_file"
        done < <(tail -n +2 "$table")

        # Replace the original file with the updated temp file
        mv "$tmp_file" "$table"
        echo "--------------------------------"
        print_table "$table"
        read -p "do you want to update more [y/n]: " value
        if [[ $value =~ [yY] ]]; then
            continue
        else
            break
        fi   
    done
}
