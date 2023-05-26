null :
	echo "Please provide some command"

.phony : env-setup extras database install-drogon postgres doxygen

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
	sudo apt-get install libsqlite3-dev;
	sudo apt-get install libhiredis-dev;

postgres:
	sudo apt-get install lsb-release;\
	sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'\
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
	sudo apt-get update\
	sudo apt-get -y install postgresql;
	sudo apt-get install postgresql-server-dev-all -y;

doxygen :
	cd;
	sudo apt install flex -y;
	sudo apt install bison -y;
	cd /usr/local; \
	sudo git clone https://github.com/doxygen/doxygen.git; \
	cd doxygen; \
	sudo mkdir build; \
	cd build; \
	cmake -G "Unix Makefiles" .. \
	sudo make; \ 
	sudo make install;
	 
install-drogon: env-setup extras database postgres doxygen
	cd /usr/local;\
	sudo git clone https://github.com/drogonframework/drogon;\
	cd drogon;\
	sudo git clone https://github.com/an-tao/trantor.git; \
	sudo git submodule update --init;\
	sudo mkdir build;\
	cd build;\
	sudo cmake ..;\
	sudo make && sudo make install;
