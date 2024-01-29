#!/bin/bash

# Directory setup
read -p "Enter directory name: " dirname
mkdir -p "$dirname"
cd "$dirname"

# Generate example files and subdirectories
  GNU nano 6.2                         btutorial.sh *                                 
touch file1.txt
echo -e "creating practice/groupassignment/file.txt" > file2.txt
mkdir dir1 dir2
touch dir2/file3.txt
echo -e "creating practice/groupassignment/dir1/file2.txt" > dir2/file3.txt

# Interface for choosing a topic
while true; do
    echo "Choose a topic:"
    select topic in "The Linux file system and file paths" "Manipulating files and directories" "Text processing" "File permissions" "Exit"; do
        case $topic in
            "The Linux file system and file paths")
                # Interface for choosing a command under the Linux file system and file paths topic
                while true; do
                    echo "Choose a command:"
                    select cmd in "pwd" "ls" "cd" "Back"; do
                        case $cmd in
                            "pwd")
                                # Command learning interface for pwd
                                echo "Print the current working directory"
                                echo "Command prompt: pwd"
                                read -p "Press enter to execute the command"
                                eval "$cmd"
                                break
                                ;;
                            "ls")
                                # Command learning interface for ls
                                echo "List the contents of a directory"
                                echo "Command prompt: ls"
                                read -p "Press enter to execute the command"
                                eval "$cmd"
                                break
                                ;;
                            "cd")
                                # Command learning interface for cd
                                echo "Change the working directory"
                                echo "Command prompt: cd [directory]"
                                echo "Example: cd dir1"
                                read -p "Enter directory: " dir
                                eval "$cmd $dir"
                                break
                                ;;
                            "Back")
                                # Go back to the topic selection interface
                                break 2
                                ;;
                            *)
                                # Error handling for invalid command choices
                                echo "Invalid choice. Try again."
                                ;;
                        esac
                    done
                done
                ;;
            "Manipulating files and directories")
                # Interface for choosing a command under the Manipulating files and directories topic
                while true; do
                    echo "Choose a command:"
                    select cmd in "mkdir" "touch" "cat" "Back"; do
                        case $cmd in
                            "mkdir")
                                # Command learning interface for mkdir
                                echo "Create a directory"
                                echo "Command prompt: mkdir [directory]"
                                echo "Example: mkdir newdir"
                                read -p "Enter directory name: " newdir
                                if [ -z "$newdir" ]; then
                                    echo "Directory name cannot be empty."
                                else
                                    eval "$cmd $newdir"
                                    echo "Directory created successfully."
                                fi
                                break
                                ;;
                            "touch")
                                # Command learning interface for touch
                                echo "Create a file"
                                echo "Command prompt: touch [file]"
                                echo "Example: touch newfile.txt"
                                read -p "Enter file name: " newfile
                                if [ -z "$newfile" ]; then
                                    echo "File name cannot be empty."
                                else
                                    eval "$cmd $newfile"
                                    echo "File created successfully."
                                fi
                                break
                                ;;
                            "cat")
                                # Command learning interface for cat
                                echo "Display the contents of a file"
                                echo "Command prompt: cat [file]"
                                echo "Example: cat myfile.txt"
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $file"
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "Back")
                                # Go back to the topic selection interface
                                break 2
                                ;;
                            *)
                                # Error handling for invalid command choices
                                echo "Invalid choice. Try again."
                                ;;
                        esac
                    done
                done
                ;;
            "Text processing")
                # Interface for choosing a command under the Text processing topic
                while true; do
                    echo "Choose a command:"
                    select cmd in "grep" "sed" "awk" "Back"; do
                        case $cmd in
                            "grep")
                                # Command learning interface for grep
                                echo "Search for a pattern in a file"
                                echo "Command prompt: grep [pattern] [file]"
                                echo "Example: grep 'hello' myfile.txt"
                                read -p "Enter pattern: " pattern
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $pattern $file"
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "sed")
                                # Command learning interface for sed
                                echo "Stream editor for text transformation"
                                echo "Command prompt: sed [options] [script] [file]"
                                echo "Example: sed 's/old/new/g' myfile.txt"
                                read -p "Enter sed script: " script
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $script $file"
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "awk")
                                # Command learning interface for awk
                                echo "Pattern scanning and processing language"
                                echo "Command prompt: awk [script] [file]"
                                echo "Example: awk '{print $1}' myfile.txt"
                                read -p "Enter awk script: " script
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $script $file"
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "Back")
                                # Go back to the topic selection interface
                                break 2
                                ;;
                            *)
                                # Error handling for invalid command choices
                                echo "Invalid choice. Try again."
                                ;;
                        esac
                    done
                done
                ;;
            "File permissions")
                # Interface for choosing a command under the File permissions topic
                while true; do
                    echo "Choose a command:"
                    select cmd in "chmod" "chown" "chgrp" "Back"; do
                        case $cmd in
                            "chmod")
                                # Command learning interface for chmod
                                echo "Change file permissions"
                                echo "Command prompt: chmod [permissions] [file]"
                                echo "Example: chmod 755 myfile.txt"
                                read -p "Enter permissions: " permissions
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $permissions $file"
                                    echo "File permissions changed successfully."
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "chown")
                                # Command learning interface for chown
                                echo "Change file owner"
                                echo "Command prompt: chown [owner] [file]"
                                echo "Example: chown user myfile.txt"
                                read -p "Enter owner: " owner
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $owner $file"
                                    echo "File owner changed successfully."
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "chgrp")
                                # Command learning interface for chgrp
                                echo "Change file group"
                                echo "Command prompt: chgrp [group] [file]"
                                echo "Example: chgrp users myfile.txt"
                                read -p "Enter group: " group
                                read -p "Enter file name: " file
                                if [ -f "$file" ]; then
                                    eval "$cmd $group $file"
                                    echo "File group changed successfully."
                                else
                                    echo "File does not exist."
                                fi
                                break
                                ;;
                            "Back")
                                # Go back to the topic selection interface
                                break 2
                                ;;
                            *)
                                # Error handling for invalid command choices
                                echo "Invalid choice. Try again."
                                ;;
                        esac
                    done
                done
                ;;
            "Exit")
                # Exit the script
                exit 0
                ;;
            *)
                # Error handling for invalid topic choices
                echo "Invalid choice. Try again."
                ;;
        esac
    done
done
