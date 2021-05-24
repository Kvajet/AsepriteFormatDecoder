CXX=g++
CXXFLAGS=-std=c++17 -Wall -Wextra -pedantic -g
TARGET=AsepriteDecoder

BUILD_DIR=build
MKDIR=mkdir -p

.PHONY: all
all: compile run

.PHONY: compile
compile: $(TARGET)

.PHONY: run
run: $(TARGET)
	./$(TARGET)

valgrind: $(TARGET)
	valgrind ./$(TARGET)

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)/ $(TARGET) 2>/dev/null

$(TARGET): $(BUILD_DIR)/CAsepriteFileFormat.o $(BUILD_DIR)/CAsepriteFileHandler.o $(BUILD_DIR)/main.o
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: src/%.cpp
	$(MKDIR) $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# .o patterns

$(BUILD_DIR)/CAsepriteFileFormat.o: src/CAsepriteFileFormat.cpp src/CAsepriteFileFormat.h src/CAsepriteFileHandler.h
$(BUILD_DIR)/CAsepriteFileHandler.o: src/CAsepriteFileHandler.cpp src/CAsepriteFileHandler.h
$(BUILD_DIR)/main.o: src/main.cpp src/CAsepriteFileFormat.h src/CAsepriteFileHandler.h