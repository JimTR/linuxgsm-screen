# linuxgsm-screen
this is an enhancement (?) to lgsm that allows you to use either GNU screen or TMUX as a multiplexer

Installing

1. Make sure you have GNU screen installed and you server is <b>not</b> running

2. Download the files and place them in the correct folder currently /lgsm/functions under your game folder
   Example /home/user/gmodserver/lgsm/functions

3. Mark them read only 

4. Open one of the game configuration files in /config-lgsm/<servername> under you game folder
   only add to either common.cfg or <servername>.config<br>
   Example /home/user/gmodserver/config-lgsm/gmodserver/common.cfg or /home/user/gmodserver/config-lgsm/gmodserver/gmodserver.cfg

5. Add the following line to the selected file
   <b>output=screen</b>

6. save the file

7. Restart your server

<p>Reason for this mod is to allow lgsm to work with my other projects namely PHPgsm & PHPgsm remote more details on these are in their repositories</p>

<p><b>I strongly suggest you only use this mod if you intend to use PHPgsm</b></p> 
    
<p>
 To revert back to TMUX 
1. stop your server

2. simply comment out or remove the line <b>output=screen</b> from your config file

3. restart your server
</p>
