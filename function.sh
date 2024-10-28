## Function
function mk() {
        mkdir -p $1
        cp ~/.dotfiles/default.cpp $1/$1.cpp
        touch $1/$1.in
}
function dos2linux() {
	iconv -f GBK -t UTF-8 -o $1 $1
	convmv -f GBK -t UTF-8 --notest --nosmart $1
}
function compile() {
	g++ $FILE.cpp -o $FILE -std=c++14 -Wall $*
	if [ $RUN ]; then
		./$FILE
	fi
}
function rbackup() {
	DEVICE="/dev/sda3"
	if [ $# -eq 1 ]; then
		DEVICE=$1
	fi
	if [ ! -e $DEVICE ]; then
		echo "$DEVICE does not exist."
		return -1
	fi
	sudo mount $DEVICE /mnt && sudo rsync -aAXHvxr --delete --delete-excluded --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/lost+found/' --exclude='/home/shwstone/[^.]*' / /mnt
	sudo umount /mnt
}
function dbackup() {
	DEVICE="/dev/sda4"
	if [ $# -eq 1 ]; then
		DEVICE=$1
	fi
	if [ ! -e $DEVICE ]; then
		echo "$DEVICE does not exist."
		return -1
	fi
	sudo mount $DEVICE /mnt && sudo rsync -avxr --delete --delete-excluded --exclude='/.*' /home/shwstone/ /mnt/dbackup
	sudo umount /mnt
}
function rrecover() {
	DEVICE="/dev/sda3"
	if [ $# -eq 1 ]; then
		DEVICE=$1
	fi
	if [ ! -e $DEVICE ]; then
		echo "$DEVICE does not exist."
		return -1
	fi
	sudo mount $DEVICE /mnt && sudo rsync -aAXHvxr --delete --delete-excluded --exclude='/dev/*' --exclude='/proc/*' --exclude='/sys/*' --exclude='/tmp/*' --exclude='/run/*' --exclude='/mnt/*' --exclude='/media/*' --exclude='/lost+found/' --exclude='/home/shwstone/[^.]*' /mnt/ /
	sudo umount /mnt
}
function drecover() {
	DEVICE="/dev/sda4"
	if [ $# -eq 1 ]; then
		DEVICE=$1
	fi
	if [ ! -e $DEVICE ]; then
		echo "$DEVICE does not exist."
		return -1
	fi
	sudo mount $DEVICE /mnt && sudo rsync -avxr --delete --delete-excluded --exclude='/.*' /mnt/dbackup/ /home/shwstone
	sudo umount /mnt
}

