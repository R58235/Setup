Setup

This GNU makefile is used for initializing development environment or personnel production server.

Since i use GNU/linux based system based on Debian distribution for developement and production, it becomes annoying to re-setup environment each time I create a new cloud instance or WSl instance. Therefore I created this make file which contains commands for setting up all the software and tools i require.

Pre-requisites : sudo should be enabled for the user.

Available Tools and Programming Languages:

Programming language: go,
Tools: apt update, man(manual pages), build-essentials, nginx

Commands available:

Syntax: make <command>

1) No command	: Displays Doc/README.md
2) All		: Downloads all the programs and files, suitable for first-time initialization.
3) setup	: apt update.
4) tools	: installs tools like man, net-tools, netcat
5) gcc		: installs build-essentials.
6) go		: Dounloads and set's up go programming language.
7) nginx	: Downloads and set' up nginx.
