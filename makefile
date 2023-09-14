# Makefile

# コンパイラとオプション
CXX = g++
CXXFLAGS = -std=c++11

# ソースディレクトリ
SRC_DIR = source

# ソースファイル
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)

# オブジェクトファイル
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(SOURCES:.cpp=.o)))

# カレントディレクトリの名前を取得
CURRENT_DIR_NAME := $(notdir $(CURDIR))

# ビルドディレクトリ
BUILD_DIR = build

# 実行ファイルの名前
EXECUTABLE = $(BUILD_DIR)/$(CURRENT_DIR_NAME)

# インクルードディレクトリ
INCLUDE_DIR = include

# clean ルール
clean:
	rm -rf $(BUILD_DIR) $(EXECUTABLE)

# ビルドディレクトリ作成ルール
$(BUILD_DIR):
	mkdir -p $@

# オブジェクトファイル生成ルール
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# ビルドルール
$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@
	./$@

# all ターゲット (デフォルトターゲット)
all: $(EXECUTABLE)

# re ターゲット
re: clean all
