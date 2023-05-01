null :
	echo "Please provide some command"

.phony : env-setup extras database install-drogon

env-setup :
	sudo apt install git -y;
	sudo apt install gcc -y;
	sudo apt install g++ -y;
	sudo apt install cmake -y;

extras : 
	sudo apt install libboost-all-dev;
	sudo apt install libjsoncpp-dev;
	sudo apt install uuid-dev;
	sudo apt install openssl;
	sudo apt install libssl-dev;
	sudo apt install zlib1g-dev;

database:
	sudo apt-get install postgresql-all;
	sudo apt-get install libsqlite3-dev;
	sudo apt-get install libhiredis-dev;

install-drogon: env-setup extras database
	cd /usr/local/;\
	sudo git clone https://github.com/drogonframework/drogon;\
	cd drogon;\
	sudo git clone https://github.com/an-tao/trantor.git; \
	git submodule update --init;\
	sudo mkdir build;\
	cd build;\
	sudo cmake ..;\
	sudo make && sudo make install;
