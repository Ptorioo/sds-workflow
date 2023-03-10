# Makefile for compiling the project. DO NOT EDIT THIS UNLESS YOU KNOW WHAT YOU ARE DOING
# GNU Make 4.4
# Built for x86_64-pc-msys
# Copyright (C) 1988-2022 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
#===================================================================================

# Allow only one "make -f Makefile2" at a time, but pass parallelism
.NOTPARALLEL:

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE)
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands
$(VERBOSE).SILENT:

#===================================================================================
# Set environment variables for the build

# Current compiler : MinGW-w64-GCC (version 12.2.0 required)
CC = g++

# Imported external library
LIB = lib

# Building directory (automatically generated after compilation)
BUILD_DIR = build

# Source code directory
SOURCE = src

# Addition resource for extra inculded files
RESOURCE = res

# Object directory
OBJ = obj

# Build target
TARGET = sdsWorkflow

# Programming language of the desired compiling target
LANGUAGE = CPP

# SFML current library
SFML = SFML-2.5.1

# Curl current library
CURL = curl-7.87.0-win64-mingw

#===================================================================================
# Target rules for compilation

execute: move_target_to_build_dir
	.\$(BUILD_DIR)\$(TARGET).exe
.PHONY: execute

build: move_target_to_build_dir
.PHONY: build

move_target_to_build_dir: output_target
	mv *.o $(BUILD_DIR)/$(OBJ) && mv *.exe $(BUILD_DIR)/ && mv *.res $(BUILD_DIR/)/
.PHONY: move_target_to_build_dir

output_target: compile_target build_icon
	$(CC) -o $(TARGET) $(TARGET).o fetch.o data.o icon.res -L .\$(LIB)\$(CURL)\lib -lcurl -L .\$(LIB)\$(SFML)\lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lwinmm -lgdi32 
.PHONY: output_target

compile_target: copy_res build_obj
	$(CC) -c $(SOURCE)\$(TARGET).$(LANGUAGE) $(SOURCE)\fetch.$(LANGUAGE) $(SOURCE)\data.$(LANGUAGE) -I .\$(LIB)\$(CURL)\include -I .\$(LIB)\$(SFML)\include -DSFML_STATIC
.PHONY: compile_target

copy_res: build_res
	cp -a $(RESOURCE) $(BUILD_DIR)
.PHONY: copy_res

build_obj: build_build_dir
	mkdir $(BUILD_DIR)/$(OBJ)
.PHONY: build_obj

build_res: build_build_dir
	mkdir $(BUILD_DIR)/$(RESOURCE)
.PHONY: build_res

build_build_dir: clean
	mkdir -p $(BUILD_DIR)

build_icon: clean
	windres .\$(RESOURCE)\icon.rc -O coff -o icon.res

clean: clean_build_dir clean_file
.PHONY: clean

clean_build_dir:
	rm -f -r $(BUILD_DIR)

clean_file:
	rm -f *.o *.exe *.res