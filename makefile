#makefile

# Flags passed to the C++ compiler.
CXXFLAGS += -g -Wall -Wextra
LIBS +=
INCLUDE += -I./src/utils/
MAIN_SRC = ./src/main/main.cxx
SRC = ./src/utils/*.cxx
HEADER = ./src/utils/*.h
EXE_NAME = main.out

all: $(SRC) $(MAIN_SRC) $(HEADER)
	g++ $(INCLUDE) $(CXXFLAGS) $(LIBS) -o $(EXE_NAME) $(MAIN_SRC) $(SRC) 

# GoogleTest
GTEST_DIR = /usr/local/gtest
GTEST_HEADERS = $(GTEST_DIR)/include/gtest/*.h \
                $(GTEST_DIR)/include/gtest/internal/*.h
GTEST_LIBS = -lgtest -lgtest_main
GTEST_INCLUDE += -I$(GTEST_DIR)/include

DRIVER = ./test/driver/*.cxx
STUB_INCLUDE = -I./test/stub
STUB_HEADER = 
#STUB_HEADER = ./test/stub/*.cxx
STUB = 
#STUB = ./test/stub/*.cxx
TEST_EXE_NAME = unittest.out 

unittest:  $(SRC) $(STUB) $(DRIVER) $(HEADER) $(STUB_HEADER) $(GTEST_HEADERS)
	g++ $(GTEST_INCLUDE) $(INCLUDE) $(STUB_INCLUDE) $(CXXFLAGS) -lpthread $(GTEST_LIBS) -o $(TEST_EXE_NAME) $(DRIVER) $(STUB) $(SRC) 

# Doxygen

doc:
	rm -rf ./doxygen
	doxygen ./Doxyfile

# Clean

clean:
	 rm -f $(EXE_NAME) $(TEST_EXE_NAME)