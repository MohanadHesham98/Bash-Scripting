DB() {
    PS3="Enter your choice: "
    select choice in "create DB" "list DB" "drop DB" "connect DB" "exit"
    do
        case $choice in
            "create DB")
                path=$(pwd)
                echo "Your DB will be created in $path"
                echo "--------------------------------"
                while true
                do
                    read -p "Enter a new DB name: " your_db_name 
                    echo "--------------------------------"
                    if [[ -d $your_db_name || -f $your_db_name ]]; then
                        echo "Already exists."
                        echo "--------------------------------"
                        continue
                    elif [[ ! $your_db_name =~ ^[a-zA-Z0-9_]+$ ]]; then
                        echo "Invalid name. Database name should only contain alphanumeric characters and underscores."
                        your_db_name=$(echo "$your_db_name" | sed 's/[^a-zA-Z0-9]/_/g')
                        echo "Cleaned DB name: $your_db_name"
                        read -p "suggest name '$your_db_name' ,do you want this suggution name [y/n]: " value
                        if [[ $value =~ [yY] ]]; then
                            mkdir "$your_db_name"
                            echo "Your DB is created. Its name is: $your_db_name"
                            echo "--------------------------------"
                            read -p "do you want to create more [y/n]: " value
                            if [[ $value =~ [yY] ]]; then
                                continue
                            else
                                break
                            fi       
                        else
                            continue
                        fi
                        else
                            mkdir "$your_db_name"
                            echo "Your DB is created. Its name is: $your_db_name"
                            echo "--------------------------------"
                            read -p "do you want to create more [y/n]: " value
                            if [[ $value =~ [yY] ]]; then
                                continue
                            else    
                                break 
                            fi               
                    fi
                    
                done       
            ;;
            "list DB")
                ls -F | grep "/"
            ;;
            "drop DB")
                while true; do
                    read -p "Enter DB you want to delete: " your_db_name

                    if [[ -d $your_db_name || -f $your_db_name ]]; then
                        rm -fr "$your_db_name"
                        echo "$your_db_name is deleted"
                        echo "--------------------------------"
                    else
                        echo "It doesn't exist"
                        read -p "Do you want to exit? [y/n]: " value
                        if [[ $value =~ [yY] ]]; then
                            break
                        else
                            continue
                        fi
                    fi

                    read -p "Do you want to delete more? [y/n]: " value
                    if [[ $value =~ [yY] ]]; then
                        continue
                    else
                        break
                    fi
                done
            ;;
            "connect DB")
                read -p "enter DB you want to connect : " your_db_name
                if [[ -d $your_db_name || -f $your_db_name ]];then
                    cd "$your_db_name"
                    echo "you now in $your_db_name"
                    break
                else
                    echo "it doesn't exist" 
                fi
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
