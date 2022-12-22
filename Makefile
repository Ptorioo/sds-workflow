# Makefile for compiling the project. DO NOT EDIT THIS UNLESS YOU KNOW WHAT YOU ARE DOING.
# GNU Make 4.4
# Built for x86_64-pc-msys
# Copyright (C) 1988-2022 Free Software Foundation, Inc.
# License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>
#===================================================================================

.NOTPARALLEL:

.SUFFIXES: .hpux_make_needs_suffix_list

$(VERBOSE)MAKESILENT = -s

$(VERBOSE).SILENT:

#===================================================================================

compile: copyres
	$(CC) -c $(SOURCE)\$(TARGET).$(LANGUAGE) -I .\$(LIB)\include -DSFML_STATIC
	$(CC) $(TARGET).o -o $(TARGET).exe -L .\$(LIB)\lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lwinmm -lgdi32
	mv *.o *.exe $(BUILD_DIR)/
	.\$(BUILD_DIR)\$(TARGET).exe
.PHONY: compile

copyres: clean
	mkdir -p $(BUILD_DIR) && mkdir $(BUILD_DIR)/$(RESOURCE) && cp -a $(RESOURCE) $(BUILD_DIR)
.PHONY: copyres

clean: 
	rm -f -r $(BUILD_DIR) && rm -f *.o *.exe
.PHONY: clean

#===================================================================================

CC = g++

LIB = SFML-2.5.1

BUILD_DIR = build

SOURCE = src

RESOURCE = res

TARGET = main

LANGUAGE = CPP