#!/bin/zsh


quelle=/Users/samupriv
repo=/Volumes/restic/samu_mbp
mount=/Volumes/restic
export RESTIC_PASSWORD="***"

function prepare {
	mkdir -p /Volumes/restic
	mount -t  nfs -o soft,intr,rsize=8192,wsize=8192,timeo=900,retrans=3,proto=tcp 192.168.99.29:/mnt/tank/backups/restic $mount
}

function backup {
	restic -r $repo --verbose backup $quelle --exclude="*.DS_Store" --exclude="*.Trash*" --exclude=".localized" --exclude="${HOME}/bin/" --exclude="${HOME}/Applications/" --exclude="${HOME}/.android/" --exclude="${HOME}/Library/"
}

function cleanup {
	sleep 3
	umount $mount
	exit 0
}


function check {
	restic -r $repo --verbose check	
}

function prune {
	restic -r $repo --verbose prune	
}


case $1 in
    backup)
        shift
        prepare
        backup
        cleanup
        ;;
 
    check)
        shift

        prepare
        check
        cleanup
 
        ;;
 
    prune)
        shift
 
        prepare
        prune
        cleanup
 		;;
    mount)
        shift
 
        prepare
 		;;
    unmount)
        shift
 
        cleanup
 		;;

    *)
        echo "No command specified for the script!"
        exec $@
        ;;
esac
