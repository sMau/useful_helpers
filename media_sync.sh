#!/bin/sh

rsync -r -z -v --bwlimit=3500 --partial --no-perms --no-owner --no-group --append-verify --rsh='ssh -p22' /mnt/MainPool/Media/Filme /mnt/VolatilePool/Media/Filme /mnt/MainPool/Media/Serien /mnt/VolatilePool/Media/Serien /mnt/VolatilePool/Media/Ebooks /mnt/VolatilePool/Media/Hörbücher samuel@lancetekk.de:/tank/media/
rsync -r -z -v --partial --no-perms --no-owner --no-group --append-verify --rsh='ssh -p22222' /mnt/MainPool/Media/Filme /mnt/VolatilePool/Media/Filme /mnt/VolatilePool/Media/Filme3D root@ixt1tb7ghl8xmbur.myfritz.net:/mnt/Main/Media/

