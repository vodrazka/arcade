#!/bin/sh

## do for all in /operator/users/vodrazka
cd /operator/users/
for player in *; do
echo "Preparing player $player"
adduser --disabled-password --gecos "" -s /play.sh $player
passwd -u $player
mkdir /home/$player/.ssh/
curl -s https://github.com/$player.keys >> /home/$player/.ssh/authorized_keys
chmod -R 700 /home/$player/.ssh/
chown -R $player:$player /home/$player/.ssh/
done
ssh-keygen -A

## build games
# for all /operator/games/g1
cd /operator/games/
for g in *; do
  echo "Preparing game $g"
  git clone `cat $g` $g.git
  cd "$g.git"
  chmod a+x *.sh
  ./build.sh &&\
  ./test.sh
done

## start server
/usr/sbin/sshd -D -e "$@"
