source "$SCRIPT_DIR/create_table.sh"
source "$SCRIPT_DIR/drop_table.sh"
source "$SCRIPT_DIR/insert_table.sh"
source "$SCRIPT_DIR/selected.sh"
source "$SCRIPT_DIR/delete_table.sh"
source "$SCRIPT_DIR/update_table.sh"
source "$SCRIPT_DIR/print_table.sh"
inside_DB() {
	
    echo "Main Menu:" 
    select choice in "create table" "list tables"  "print table" "drop table" "insert table" "select from table" "delete from table" "update table" "exit"
    do
        case $choice in
            "create table")
                create_table
			;;
            "list tables")
                ls -F 
            ;;
            "print table")
                read -p "enter table you want to see: " table
                print_table "$table"
            ;;
            "drop table")
                drop_table
			;;
            "insert table")
                insert_table
			;;
            "select from table")
                selected			
			;;
            "delete from table")
                delete_table
			;;
            "update table")
                update_table			
			;;
            "exit")
                echo "Goodbye!"
				break  			
			;;
            *)
				echo "Invalid option!"
            ;;
        esac
    done

}


