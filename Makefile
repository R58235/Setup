all : setup go tools
.phony : all setup go tools

setup :
	sudo apt update;

tools:
	sudo apt install man build-essential -y;

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
