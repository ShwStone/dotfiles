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
	sudo mount $DEVICE /mnt && sudo rsync -aAXHvxr --delete --delete-excluded --exclude-from=/home/shwstone/.dotfiles/rbackup.exclude / /mnt
	sudo umount $DEVICE
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
	sudo mount $DEVICE /mnt && sudo rsync -avxr --delete --delete-excluded --exclude-from=/home/shwstone/.dotfiles/dbackup.exclude /home/shwstone /mnt/dbackup
	sudo umount $DEVICE
}

