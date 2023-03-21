Setup

GNU makefile for faster initializing development environment or personnel production server. PS: I think Containerization is overkill and wasteful use of resources therefore have a primary setup rules and configuration.

Since i use GNU/linux based system based on Debian distribution for developement and production, it becomes annoying to re-setup environment each time I create a new cloud instance or WSl instance. Therefore I created this make file which contains commands for setting up all the software and tools i require.

Available Tools and Programming Languages:

Programming language: go, python
Tools: apt update, man(Manual pages), Nginx

Commands availbale:

Syntax: Make <command>

1) No coomand	: Setups all the software and tools without discrimination.
2) All		: Same as above
3) setup	: apt update
4) tools	: intalls tools like man, build-essentials.
5) go		: Dounloads and set's up go environment
