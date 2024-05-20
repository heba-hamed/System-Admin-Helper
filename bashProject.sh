#!/bin/bash
echo "==================== Bash Script Project. ===================="
echo "******************** This Project is created by/ Heba-Allah Saad Hamed ******************** "
echo "******************** Welcome in Admin Helper ^_^ ********************"
echo "==================== Please, Enter your choice from Menu. ===================="
select ch in "Add User" "Remove User" "Update User" "List User Details" "Add Group" "Remove Group" "Disable User Account" "Enable User Account" "Lock User Account" "Change User Password" "Exit"
do
case $ch in
"Add User")
	echo "**** In this part you can Adding New User or Adding User in Existing Group. ****"
        select opt in "Add New User" "Add User to Group"
        do
	case $opt in
        "Add New User")
                read -p "Enter username to create: " username
                read -p "Enter password: " userpassword
                sudo useradd -p "$userpassword" "$username"
                echo "$username is adding successfully.";
                echo "********** Back to Add User menu. **********";;
        "Add User to Group")
                read -p "Enter username you want to add to Group: " username
                read -p "Enter Group name you want to add user to it: " groupname
                sudo usermod -a -G "$groupname" "$username"
                echo "$username is added to $groupname successfully.";
                echo "********** Back to the main menu. **********";break ;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
                esac
        done
;;
"Remove User")
	echo "**** In this part you can Delete Existing User or Delete User from Specific Secondary Group. **** "
        select opt1 in "Delete User" "Delete User from Group"
        do
	case $opt1 in
       "Delete User")
                read -p "Enter username to remove: " username
                sudo userdel -r "$username"
                echo "Removing $username is completed.";
                echo "********** Back to Remove User menu. **********";;
       "Delete User from Group")
                read -p "Enter username you want to delete from group: " username
                read -p "Enter group you want delete user from it: " groupname
                sudo gpasswd -d "$username" "$groupname"
                echo "$username is removed from $groupname successfully.";
                echo "********** Back to the main menu. **********";break ;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
                esac
        done
;;
"Update User")
	echo "**** In this part You can Update User by two options. ****"
        select opt2 in "Updating Username" "Updating UID"
        do
	case $opt2 in
        "Updating Username")
                read -p "Enter username you want to update username: " username
                read -p "Enter new username: " newname
                sudo usermod -l "$newname" "$username"
                echo "Updating Username $newname is completed.";
                echo "********** Back to Update User menu. **********";;
        "Updating UID")
                read -p "Enter username you want to update UID: " username
                read -p "Enter new UID: " newUID
                sudo usermod -u "$newUID" "$username"
                echo "Updating UID of $username is completed.";
                echo "********** Back to the main menu. **********";break ;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********";break;;
                esac
        done
;;
"List User Details")
        echo "**** In this part You have two options for List User Details. ****"
        select opt3 in "User ID" "User Details"
        do
        case $opt3 in
        "User ID")
                read -p "Enter username to show UID: " username
                sudo id "$username"
                echo "$username id is showing successfully." ;
                echo "********** Back to List User Details menu. **********" ;;
        "User Details")
                read -p "Enter user name you want to show more details: " username
                sudo chage -l  "$username"
                echo "List $username is completed. " ;
                echo "********** Back to the main menu. **********";break ;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
                esac
        done
;;
"Add Group")
         echo "**** In this part You can Adding new Secondary Group. ****"
         select opt4 in "Add New Group"
         do
         case $opt4 in
         "Add New Group")
               read -p "Enter group name: " groupname
               sudo groupadd "$groupname"
               echo "Adding $groupname is completed" ;
               echo "********** Back to the main menu. **********";break;;
               *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
               esac
         done
;;
"Remove Group")
         echo "**** In this part You can Delete Secondary Group. ****"
         select opt5 in "Delete Group"
         do
         case $opt5 in
         "Delete Group")
              read -p "Enter groupname you want to remove: " groupname
              sudo groupdel "$groupname"
              echo "Removing $groupname is completed." ;
              echo "********** Back to the main menu. **********";break ;;
              *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
              esac
         done
;;
"Disable User Account")
        echo "**** In this part You can Disale User Account. ****"
        select opt6 in "Disable Account"
        do
        case $opt6 in
        "Disable Account")
              read -p "Enter user name you want to disable: " username
              sudo usermod -e "1" "$username"
              echo "$username account is disabled.";
              echo "*********** Back to the main menu. **********";break;;
              *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
              esac
        done
;;
"Enable User Account")
        echo "**** In this part You can Enable User Account From both of Disabling & Locking. ****"
                select opt7 in "Enable Account From Disabling" "Enable Account From Locking"
                do
                case $opt7 in
        "Enable Account From Disabling")
                read -p "Enter user name you want to enable: " username
                sudo usermod -e "" "$username"
                echo "$username is enabling sccessfully." ;
                echo "********** Back to Enable User Account menu. *********** " ;;
        "Enable Account From Locking")
                read -p "Enter user name you want to enable: " username
                sudo passwd -u "$username"
                echo "$username account unlocking is completed." ;
                echo "********** Back to the main menu. ***********";break;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
                esac
        done
;;
"Lock User Account")
        echo "**** In this part You can Lock User Account. ****"
                select opt8 in "Lock Account"
                do
                case $opt8 in
      "Lock Account")
                read -p "Enter user name you want to lock: " username
                sudo usermod -L "$username"
                echo "$username account is locked.";
                echo "********** Back to the main menu. **********";break;;
                *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
                esac
        done
;;
"Change User Password")
        echo "**** In this part You can Change User Password. ****"
        select opt9 in "Changing Password"
        do
        case $opt9 in
        "Changing Password")
               read -p "Enter user name you want to changing password: " username
               sudo passwd --stdin "$username"
               echo "$username password is changing";
               echo "********** Back to the main menu. **********";break;;
               *) echo "********** $REPLY is not correct choice. Back to the main menu. **********" ;break;;
               esac
        done
;;
"Exit") echo "******************** Thank you for using my program. I hope this program is helpful for you ^_^ ********************" ;exit;;

*) echo "===================== $REPLY is not correct choice! ====================" ;
   echo "===================== Please, Try entering another invalid choice next time. ====================";exit;;

esac

done


