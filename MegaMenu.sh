# ============================================================ #
# This script runs multiple scripts if password input is valid #
# Created by Anna Garay on 14 June 2020                        #
# ============================================================ #
#!/bin/bash
#set -x

#set color codes
Blue='\033\e[34m'
LGreen='\033\e[92m'
Red='\033\e[31m'
Yellow='\033\e[33m'
LCyan='\033\e[96m'
White='\033\e[97m'

#inputs password and saved in "result" file
file="./result"
bash /home/kali/scripts/portfolio/week2/passwordCheck.sh > result

#validates password by reading "result" file line by line
while IFS= read -r line; do
   if [[ "$line" == "Access Granted" ]]; then
        pass="Access Granted"
        echo $'\n'
       echo -e "${LGreen}$pass"
    fi
done <"$file"

#performs corresponding scripts if granted access
if [ "$pass" == "Access Granted" ]; then
    while true
    do
        echo $'\n'
        echo -e "${LCyan}1. Create folder"
        echo "2. Copy folder"
        echo "3. Set password"
        echo "4. Calculator"
        echo "5. Create week folders"
        echo "6. Check filenames"
        echo "7. Download a file"
        echo "8. Exit"
        echo -e "${White}" $'\n'
        read -p "Enter option: " opt
        case $opt in
            #runs the create folder script
            1)
            bash ~/scripts/portfolio/week2/foldermaker.sh
            ;;
            #runs the copy folder script
            2)
            bash ~/scripts/portfolio/week2/foldercopier.sh
            ;;
            #runs the create password script
            3)
            bash ~/scripts/portfolio/week2/setPassword.sh
            ;;
            #runs the calculator script
            4)
            bash ~/scripts/portfolio/week3/calculator.sh
            ;;
            #runs the megafolder creation script
            5)
            bash ~/scripts/portfolio/week3/enterArguments.sh
            ;;
            #runs the folder description script
            6)
            bash ~/scripts/portfolio/week3/filenames.sh
            ;;
            #runs the web downloader script
            7)
            bash ~/scripts/portfolio/week3/internetDownloader.sh
            ;;
            #quits the program
            8)
            echo -e "${Yellow}Exitting"
            exit 0
            ;;
            #invalidates not within the range entries 
            *)
            echo -e "${Red}Invalid entry $REPLY. Please enter another option [1-8]. "
            ;;
        esac
    done
else
    #denies access if password does not exists
    pass="Access Denied"
    echo $'\n'
    echo -e "${Red}"$pass
    exit 1
fi

#waits 3secs before exit
read -t 3 -p " "

exit 0