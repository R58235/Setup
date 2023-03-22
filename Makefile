all : setup tools go nginx
.phony : all setup tools go nginx

setup :
	sudo apt update;

tools:
	sudo apt install man build-essential net-tools netcat -y;

go :
	wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz;
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz;
	export PATH=$$PATH:/usr/local/go/bin;
	go version;
	read -p "State your Username for working directory creation:" username; \
        read -p "State your Github Username for repository directory creation:" g_username; \
        root_dir=/home/$$username; \
        mkdir -p $$root_dir/github.com/$$g_username; \
        mkdir -p $$root_dir/go/src/github.com/$$g_username;

nginx: 
	sudo apt install curl gnupg2 ca-certificates lsb-release debian-archive-keyring -y;
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

