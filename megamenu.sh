# ================================== #
# This script runs a case statement  #
# ================================== #
#!/bin/bash
#set -x

#color codes
Blue='\033\e[34m'
LGreen='\033\e[92m'
Red='\033\e[31m'
Yellow='\033\e[33m'
LCyan='\033\e[96m'
White='\033\e[97m'

#=====================================
file="./result"
bash ~/scripts/portfolio/week2/passwordCheck.sh > result
while IFS= read -r line; do
    if [[ "$line" == "Access Granted" ]]; then
        pass="Access Granted"
        echo $'\n'
        echo -e "${LGreen}$pass"
    fi
done <"$file"

#performs actions if access granted
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
            1)
            bash ~/scripts/portfolio/week2/foldermaker.sh
            ;;
            2)
            bash ~/scripts/portfolio/week2/foldercopier.sh
            ;;
            3)
            bash ~/scripts/portfolio/week2/setPassword.sh
            ;;
            4)
            bash ~/scripts/portfolio/week3/calculator.sh
            ;;
            5)
            bash ~/scripts/portfolio/week3/enterArguments.sh
            ;;
            6)
            bash ~/scripts/portfolio/week3/filenames.sh
            ;;
            7)
            bash ~/scripts/portfolio/week3/internetDownloader.sh
            ;;
            8)
            echo -e "${Yellow}Exitting"
            exit 0
            ;;
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