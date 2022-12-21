all: compile

compile: copyres
	@g++ -c src/main.cpp -I .\SFML-2.5.1\include -DSFML_STATIC
	@g++ main.o -o main.exe -L .\SFML-2.5.1\lib -lsfml-graphics-s -lsfml-window-s -lsfml-system-s -lopengl32 -lwinmm -lgdi32
.PHONY: compile

copyres: clean
	@mkdir build/res && cp -a res build
.PHONY: copyres

clean: 
	@rm -f build/run.exe && rm -f -r build/res && rm -f *.o && rm -f *.exe
.PHONY: clean