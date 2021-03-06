#!/bin/bash
#######################################
#    Created by Sishaar Rao
#    This is the Version 1.0 
#    implementation of Checklist 
#######################################

# Add Dependencies
. ./.dependencies/ticktick.sh


KEYWORDS=("init" "list" "add" "remove" "complete" "--version" "-v")

__tokenize (){
    # Verify that param isn't empty
    # Set first param to command if it's a keyword
    # Verify that first param is command
    
    if [[ -z $*  ]]; then
	echo "Error Code 4: No command provided"; exit 4;
    elif [[ "${KEYWORDS[*]}" == *"$1"* ]]; then
	command="$1"
    else
	echo "Error Code 4: No command provided"; exit 4;
    fi
    ${command} ${@:2}
}


init (){
    echo "This is the function for initializing a new list"
    # Ensure correct number of parameters
    # Ensure correct formatting of parameters
    [[ $# != 1 ]] && echo "Error Code 3: Incorrect Number of Parameters" && exit 3
    ! [[ $1 =~ ^[A-Za-z_]+$ ]] && echo "Error Code 3: Incorrect Parameter Formatting" && exit 3
    
    echo "Params:" $1
    # Create File Path, make sure it is unique
    file="./.saves/$1.json"
    [[ -e "$file" ]] && echo "Error Code 3: File already exists" && exit 3
    
    # Create file, make sure it is writable
    touch "$file" && [ ! -w "$file" ] && echo "Error Code 5: $file is unwritable. Todolist has deleted Save File" && rm "$file" && exit 5

    # Write to file
    cat > $file <<EOF
{
    "List":[
]
}
EOF
    exit 0
}

--version (){
    echo "Checklist 1.1"
    echo "Created by Sishaar Rao"
    exit 0
}
-v (){
    # This is ridiculous I know but for some reason ${--version} won't work so I think I'm still a plebe at shell
    a="--version"
    "${a}"
}

list (){
    echo "This is the function for listing the contents of a list"
    echo "Params:" $*
    # Print all the available lists
    if [[ $# == 0 ]]; then
	content=`cd .saves/; ls *.json; cd ..;`
	printf "Here are your`wc -w <<< "$content" | tr -s ' '` list(s)!\n"
	for list in $content; do
	    echo ${list:0:${#list}-5}
	done
    fi
    
    exit 0
}

add (){
    echo "This is the function for adding an element to a list"
    echo "Params:" $*
    exit 0
}

remove (){
    echo "This is the function for removing an element from a list"
    echo "Params:" $*
    exit 0
}

complete (){
    echo "This is the function for marking a task complete on a list"
    echo "Params:" $*
    exit 0
}


# Tokenize input, call respective function
__tokenize $*

