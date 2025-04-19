source "$SCRIPT_DIR/print_table.sh"

insert_table() {

    while true
    do    
        read -p "Enter table name to insert data : " table
        echo "--------------------------------"
        if [[ ! -f $table ]]; then
            echo "Table '$table' does not exist."
            echo "--------------------------------"
            continue
        fi
        echo "now you are in '$table' "
        echo "--------------------------------"

        
        # Read the first line (column names)
        first_line=$(head -n 1 "$table") # id name age address header store them in first_line
        columns=()
        for col in $first_line; do
            columns+=("$col")            # columns=("id" "name" "age" "address")
        done
        primary_key=${columns[0]}        # id                      
        data=()
        echo "Please enter data for each column:"
        echo "--------------------------------"
        for (( i=0; i<${#columns[@]}; i++ )); do
            read -p "${columns[$i]}: " value
            data+=("$value")
        done

        # Check if the entered primary key already exists in the table
        primary_key_value="${data[0]}"  # The primary key is in the first column (id) value of id
        
        if grep -q "^$primary_key_value " "$table"; then    # search about id value in the table to ensure if exist already or not
            echo "Error: Primary key '$primary_key_value' already exists in the table."
            echo "--------------------------------"
            continue  # If primary key exists, ask the user to input data again
        fi


        # Join the values into a space-separated row
        row="${data[*]}"                # all data stored in row variable
        echo "$row" >> "$table"         # then stored in the table
        echo "Row inserted successfully!"
        echo "--------------------------------"
        print_table "$table"
        echo "--------------------------------"
        read -p "do you want add other data [y/n]: " value
        if [[ $value =~ [yY] ]]; then
            continue
        else
            break        
        fi
    done
}