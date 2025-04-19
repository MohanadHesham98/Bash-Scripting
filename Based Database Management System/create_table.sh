create_table() {
    while true; do
        read -p "Enter table name: " table
        if [[ -d $table || -f $table ]]; then
            echo "Already exists."
            echo "--------------------------------"
            continue
        elif [[ ! $table =~ ^[a-zA-Z0-9_]+$ ]]; then
            echo "Invalid name. Table name should only contain alphanumeric characters and underscores."
            table=$(echo "$table" | sed 's/[^a-zA-Z0-9]/_/g')
            echo "Cleaned table name: $table"
            read -p "Suggested name '$table'. Do you want to use it? [y/n]: " value
            if [[ $value =~ [yY] ]]; then
                touch "$table"
                echo "Your table is created. Its name is: $table"
                echo "--------------------------------"
            else
                continue
            fi
        else
            touch "$table"
            echo "Your table is created. Its name is: $table"
            echo "--------------------------------"
        fi

        columns=()
        while true; do
            read -p "Add column names (space-separated): " -a input_columns
            echo "--------------------------------"
            for column in "${input_columns[@]}"; do
                if [[ ! $column =~ ^[a-zA-Z0-9_]+$ ]]; then
                    echo "Invalid name. Table name should only contain alphanumeric characters and underscores."
                    Suggestion_column=$(echo "$column" | sed 's/[^a-zA-Z0-9_]/_/g')
                    echo "Suggested  column name: $Suggestion_column"
                    read -p "Do you want to use the suggested name? [y/n]: " choice
                    if [[ $choice =~ [yY] ]]; then
                        column=$cleaned_column
                    else
                        read -p "Please enter a valid column name: " column
                        if [[ ! $column =~ ^[a-zA-Z0-9_]+$ ]]; then
                            echo "Still invalid. Skipping this column."
                            echo "--------------------------------"
                            continue
                        fi
                    fi
                fi

                # Check for duplicate
                if [[ " ${columns[@]} " =~ " $column " ]]; then
                    echo "Column '$column' is duplicated. Skipping."
                    echo "--------------------------------"
                    continue
                fi

                columns+=("$column")
            done

            echo "Current columns: ${columns[@]}"
            echo "--------------------------------"
            read -p "Do you want to add more columns? [Y/N] " input
            echo "--------------------------------"
            if [[ $input =~ [yY] ]]; then
                continue
            elif [[ $input =~ [nN] ]]; then
                # Write header row once after finalizing columns
                echo "${columns[@]}" > "$table"
                echo "Column headers added to table '$table'."
                echo "--------------------------------"
                return
            else
                echo "Invalid choice. Assuming no."
                echo "${columns[@]}" > "$table"
                return
            fi
        done
    done
}
