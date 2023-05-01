doc : 
	cat README.md;

all : setup tools go nginx
.phony : all setup tools go nginx

setup :
	cd && sudo apt update;

tools :
	sudo apt install man net-tools netcat -y;

gcc :
	sudo apt install build-essential -y;

git: 
	sudo apt-get install git -y;

cmake: 
	cd && wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3.tar.gz;
	sudo rm -rf /usr/local/cmake && sudo tar -C /usr/local -xzf cmake-3.26.3.tar.gz;
	cd /usr/local/cmake-3.26.3;
	sudo ./bootstrap && sudo make && sudo make install;
	cd && rm cmake-3.26.3.tar.gz;

cJSON:  cmake	
	cd /usr/local && sudo git clone https://github.com/DaveGamble/cJSON.git;
	cd /usr/local/cJSON;
	mkdir build;
	cd build;
	sudo cmake ..;
	sudo make;
	sudo make install;

jsoncpp:
	sudo apt install libjsoncpp-dev;

uuid:
	sudo apt install uuid-dev;

openSSL:
	sudo apt install openssl;
	sudo apt install libssl-dev;

zlib:
	sudo apt install zlib1g-dev;

go :
	cd && wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz;
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz;
	export PATH=$$PATH:/usr/local/go/bin;
	go version;
	read -p "State your Username for working directory creation:" username; \
        read -p "State your Github Username for repository directory creation:" g_username; \
        root_dir=/home/$$username; \
        mkdir -p $$root_dir/github.com/$$g_username; \
        mkdir -p $$root_dir/go/src/github.com/$$g_username;
	cd && rm go1.20.2.linux-amd64.tar.gz;

nginx: 
	cd && sudo apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring -y;
	curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
		| sudo tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null;
	gpg --dry-run --quiet --no-keyring --import --import-options import-show \
		/usr/share/keyrings/nginx-archive-keyring.gpg;
	echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx" \
		| sudo tee /etc/apt/sources.list.d/nginx.list;
	echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
		| sudo tee /etc/apt/preferences.d/99nginx
	sudo apt update;
	sudo apt install nginx;
	sudo nginx -v;

postgresql:
	sudo apt-get install postgresql -y;

sqlite3:
	sudo apt-get install libsqlite3-dev;

redis:
	sudo apt-get install libhiredis-dev;
