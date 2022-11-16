GXX=g++
FLAGS=-Wall -Wextra -Werror -std=c++17
TEST=-lgtest
OS=$(shell uname -s)
LINUX=-lrt -lpthread -lm -D_GNU_SOURCE
DIRBUILD=build
CHECKDIR=PaintWidget/*.* Controller/*.* View/*.cpp View/*.h Model/*.* Model/Cave/*.* Model/Maze/*.*

all: test clean

install: clean build

build:
	mkdir $(DIRBUILD)
	cd $(DIRBUILD) && qmake ../Maze.pro && make
	cd $(DIRBUILD) && open Maze.app

uninstall:
	rm -rf $(DIRBUILD)

test:
ifeq ($(OS), Darwin)
	$(GXX) test.cpp  Model/*.cpp Model/*/*.cpp Controller/*.cpp -o test $(TEST)
	./test
else
	$(GXX)  test.cpp  Model/*.cpp Model/*/*.cpp Controller/*.cpp -o test $(TEST) $(LINUX)
	./test
endif

clean:
	rm -rf *.o *.out *.a *.gcda *.gcno *.info *.tar test
	rm -rf $(DIRBUILD)
