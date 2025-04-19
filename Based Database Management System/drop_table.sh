drop_table() {
    read -p "enter table you want to delete : " your_table_name
    echo "--------------------------------"
                if [[ -d $your_table_name || -f $your_table_name ]];then
                    rm -fr "$your_table_name"
                    echo "$your_table_name is deleted"
                else
                    echo "it doesn't exist"  
                fi      			
}
