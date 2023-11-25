## Function
function mk() {
        mkdir -p $1
        cp ~/Dotfiles/default.cpp $1/$1.cpp
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
