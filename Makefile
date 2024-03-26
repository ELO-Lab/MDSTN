CC = g++
CFLAGS = -O3 -std=c++11 -MMD

CEC_DIR := ./src/benchmark
CEC_SRC_FILES := $(wildcard $(CEC_DIR)/*.cpp)
CEC_OBJ_FILES := $(patsubst $(CEC_DIR)/%.cpp,$(CEC_DIR)/%.o,$(CEC_SRC_FILES))
CEC_DEP_FILES := $(patsubst $(CEC_DIR)/%.cpp,$(CEC_DIR)/%.d,$(CEC_SRC_FILES))

HVEA_DIR := ./src/mea
HVEA_SRC_FILES := $(wildcard $(HVEA_DIR)/*.cpp)
HVEA_OBJ_FILES := $(patsubst $(HVEA_DIR)/%.cpp,$(HVEA_DIR)/%.o,$(HVEA_SRC_FILES))
HVEA_DEP_FILES := $(patsubst $(HVEA_DIR)/%.cpp,$(HVEA_DIR)/%.d,$(HVEA_SRC_FILES))

all: run_experiments

run_experiments: $(HVEA_OBJ_FILES) $(CEC_OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $(HVEA_OBJ_FILES) $(CEC_OBJ_FILES)

%.o: %.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(CEC_OBJ_FILES) $(CEC_DEP_FILES) $(HVEA_OBJ_FILES) $(HVEA_DEP_FILES) *.d *.o