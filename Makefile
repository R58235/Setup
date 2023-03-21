all : setup go
.phony : all setup go

setup : 
	sudo apt update

go : 
	wget https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
	rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
	export PATH=$PATH:/usr/local/go/bin
	go version
	@read -p "State your Username for repository directory creation:" username; \
	repo_dir=./usernaem/$$username \
	mkdir -p $$repo_dir/go;
