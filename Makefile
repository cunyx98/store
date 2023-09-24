VERSION = 1
CC = g++
DEBUG = 
CXXFLAGS += -Wall -g
SOURCES = $(wildcard ./*.cpp)
INCLUDES =
LIB_NAMES =
LIB_PATH = 
OBJ = $(patsubst %.cpp, %.o, $(SOURCES))
TARGET = main

#links
$(TARGET):$(OBJ)
	$(CC) $(OBJ) $(LIB_PATH) $(LIB_NAMES) -o $(TARGET)$(VERSION)
 
#compile
%.o:%.c
	$(CC) $(INCLUDES) $(DEBUG) -c $(CXXFLAGS) $< -o $@

.PHONY:clean
clean:
	@echo "Remove linked and compiled files......"
	rm -rf $(OBJ) $(TARGET)