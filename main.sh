#!/bin/bash
#######################################
#    Created by Sishaar Rao
#    This is the Version 1.0 
#    implementation of Checklist 
#######################################

# Add Dependencies
. ./.dependencies/ticktick.sh


KEYWORDS=("init" "list" "add" "remove" "complete")

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
    echo "Params:" $*
    exit 0
}

list (){
    echo "This is the function for listing the contents of a list"
    echo "Params:" $*
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

