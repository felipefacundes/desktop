echo $(tput setaf 190)OS:
tput setaf 3
toilet -f term --gay $(uname -o)
echo
echo $(tput setaf 190)Kernel:;
tput setaf 2
uname -rm
tput setaf 3
free -hlt
tput setaf 6
df -h /dev/sda2
echo "                   $(tput setaf 6)^
$(tput setaf 14)Arch Linux        $(tput setaf 6)/$(tput setaf 4)#$(tput setaf 6)\                  
                 /$(tput setaf 4)###$(tput setaf 6)\                 
                /$(tput setaf 4)#####$(tput setaf 6)\                
               /$(tput setaf 4)#######$(tput setaf 6)\               
              /$(tput setaf 4)#########$(tput setaf 6)\              
             /$(tput setaf 4)###########$(tput setaf 6)\             
            /$(tput setaf 4)#############$(tput setaf 6)\            
           /$(tput setaf 4)###############$(tput setaf 6)\           
          /$(tput setaf 4)#################$(tput setaf 6)\          
         /$(tput setaf 4)######$(tput setaf 4)#######$(tput setaf 4)######$(tput setaf 6)\         
        /$(tput setaf 4)########     ########$(tput setaf 6)\        
       /$(tput setaf 4)########       ########$(tput setaf 6)\       
      /$(tput setaf 4)########         ########$(tput setaf 6)\      
     /$(tput setaf 4)#########         #########$(tput setaf 6)\     
    /$(tput setaf 4)##########         ##########$(tput setaf 6)\     
   /$(tput setaf 4)######                   ######$(tput setaf 6)\   
  /$(tput setaf 4)##                             ##$(tput setaf 6)\  
 /$(tput setaf 4)#                                 #$(tput setaf 6)\ "
echo
echo
tput setaf 7