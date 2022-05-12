#!/bin/sh

#use export to define bash functions

#bash does not support multiline comments

#redirect operators
#wipe the contents of a text file with
#> textfile.sh
#> to create new file, >> to append to existing file

#change directory
#cd directoryname

#if you create a text file with zero privileges
#the only way to access it is with a script
#because scripts run as root

#you can chain arguments together, check command documentation

#list directory contents
#ls

#view hidden directory contents
#ls -a

#view contents in a list
#ls -l

#lists PCI/adapter information 
#lspci

#lists cpu information
#lscpu

#lists storage device and partition information
#lsblk
#-f to view filesystem info including UUIDs
#more detailed storage information, including % used
#df -h

#lists computer specs: Processor, RAM(DIMMs), BIOS detail, Memory, Serial numbers etc.
#dmidecode

#command used to manage and create RAID devices, not installed by default
#mdadm
#It is a good idea to create partitions about 100mb smaller than the total size of the storage device and use those to create the raid array instead of using the devices themselves

#see the UUID of mounted storage
#blkid 

#mkfs can be used to format devices into mutliple filesystems, noted with .
#mkfs
#mkfs.exFat
#mkfs.btrfs

#modify file/folder permissions
#chmod

#change the owner of a file or folder
#chown

#return the name of the OS
#uname 
#for more verbose information
#uname -r

#create a new directory
#mkdir

#create a file
#touch filename.txt
#when touch generates a file in a script, the owner is root

#Establishing SSH:
#access a remote server and establish passwordless login
#ssh root@server
#exit
#ssh-keygen
#ssh-copy-id root@server
#make sure no VPNs are active
#install ssh client / server
#activate the client

#move a file and rename a directory
#mv

#displays the first 10 lines of a file
#head
#specify the number of lines to output with -n
#head -n 5

#displays the last 10 lines of a file
#tail
#specify the number of lines to output with -n
#tail -n 7

#sort input alphabetically 
#sort

#only output unique entries
#uniq

#generate list of installed packages 
#apt-cache pkgnames 

#returns a list of loaded modules in the kernel
#lsmod 

#specify absolute path via scripts working directory
#DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#multiline solution if you need support for symbolic links
#SOURCE="${BASH_SOURCE[0]}"
#while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
#  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
#  SOURCE="$(readlink "$SOURCE")"
#  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
#done
#DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#pe1 for advanced bash scripting guide
#detailed information about logged in user
#who 
#returns just username
#whoami

#displays date and time
#date 

#displays current session uptime
#uptime 

#the vim command:
#you can use vim to create new text or code files
#vim filename.txt
#open a file at a particular line number:
#vim filename.js + 35
#will also create lines up to specified number if they do not exist

#systemd supports logging with journalctl
#depending on distribution:
#$journalctl -u ssh
#$journalctl -u sshd

#change the hostname by editing these two files, reboot required
#/etc/hostname
#/etc/hosts

#systemctl is a suite of functions provided by systemd

#Trace Execution of Commands in Shell Script with Shell Tracing
#https://www.tecmint.com/trace-shell-script-execution-in-linux/

#PgDwn adds the ~ character in the default linux terminal

#export vs setenv
#export sets a shell variable and then exports it as an env var
#setenv just sets the environment variable

#define variables with declare
#declare
#cannot use this to declare directory paths with symbolic links

#text manipulation with sed
#add a comment char to the beginning of each line in a file
#sed 's/^/#/' file.txt
#must create new file, outputs to terminal

#rename all files and folders to lowercase recursively:
#$(find . -depth | xargs -n 1 rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;)
#will put all renamed files in the same directory, where command was run

#you can use find without specifying the current directory
#use -iname option to ignore case
#without -name or -iname, find works like ls and only checks $PWD
#$ find -iname regex

#partition creator and manager
#fdisk /dev/sdb

#CLI control of Virtualbox
#vboxmanage 

#word count is like len in bash
#wc 

#storage device management commands / information
#EXT3 has file journaling, EXT2 does not
#e2label or xfs_admin -L to set a label on ext4 and xfs

#blkid for partitions and their UUIDs

#temporary partition or filepath label:
#mount LABEL=”data” /dev/md0 

#finding symbolic links recursively:
#$find /home/josh -xype l
#finding and deleting symbolic links recursively:
#$find /home/josh -xype l -delete

#Wipe a drive with random data:
#dd if=/dev/urandom of=/dev/sdb

#create a bit by bit copy of a drive:
#dd if=/dev/source_drive of=/dev/copied_drive

#can look at the sequence of bytes and tell you things
#file filename.txt

#Installing a tar.gz file
#sudo tar xzvf wine-1.9.19.tar.bz2
#$ cd wine-1.9.19
#$ ./configure
#$ make
#$ sudo make install
#$ sudo reboot#


#---
#new, untested commands to try out:
#:, ., break, cd, continue, eval, exec, exit, export, getopts, hash, pwd, readonly, return, set, shift,
#test, [, times, trap, umask and unset.

#alias, bind, builtin, command, , echo, enable, help, let, local, logout, printf, read, shopt,
#type, typeset, ulimit and unalias.

#pinfo
#wipefs

#---
#unshadow command to uncover hashed passwords

#AutoHotKey but for Linux:
#https://www.semicomplete.com/projects/xdotool/

#iotop to get a list of top running processes (like task manager in Windows)
#needs sudo privileges
#how to find information about a certain process ps aux | grep [process name]

#open Files GUI of the current working directory:
#xdg-open .

#open images in the terminal with 
#xdg-open ImageName

#uname -a to view hostname, OS, kernel, release, kernel version, architecture

#systemctl status [service] (new)
#commands: start, stop, enable, disable, reload

#check the total size of a directory
#du -sh /directory 

#view active network connections
#netstat -tulpn 

#extract zip files to a directory
#unzip -q source_code.zip -d ./development

#Lsblk lists storage devices

#locate a currently running process by name and terminate it by PID
#ps aux | grep vlc
#sudo kill -9 PID

#access cron
#$crontab -e
#help you identify syntax for scheduled tasks in cron
#https://crontab.guru/

#---
#Completely removing a package with apt (turn into a function / script)
#See if a package is installed by name:
#apt list --installed | grep PackageName

#Removing a package:
#sudo apt-get remove PackageName
#sudo apt-get purge PackageName
#sudo apt-get autoremove
#---

#installing a package from a .deb file in the current working directory:
#sudo apt install ./package.deb

#A script can export variables only to child processes, that is, only to commands or processes which that particular script initiates:
#export -p VARNAME=”TEST”

#You can also use this technique to move quickly to a directory at the same level in the directory tree as your current one. You hop up one level, and then back down one into a different directory.
#cd ../gc_help

#ls repla?echar.txt
#ls re?????char.txt
#ls ?????.txt

#Background Process:
#commandname & 
#to have processes run in the background so you can get back to the terminal

#seventh command you ran in your history
#!7
#!! to run the previous command

#---
#rsync:
#copies only the files that have not been backed up yet
#does not delete files in the backup directory that were not specific by a backup command

#rsync -r directory/to/backup where/to/backup
#rsync -av --dry-run 

#rsync --delete to delete files in the backup directory that were not specific by the backup com
#---

#getting user input: user the read command
#read var1

#copying something to the clipboard:
#something to Stout | xsel -ib

#w or who commands to print currently logged in users
#date command to display the date and time

#Tar supports these package formats:
#tar xf archive.tar.xz
#tar xf archive.tar.gz
#tar xf archive.tar
#If tar gives a Cannot exec error, you may need to sudo apt install xz-utils first.
