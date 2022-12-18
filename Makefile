all: compile

compile: copyres
	g++ -s  src/calculator.cpp src/main.cpp -o build/run

copyres: clean
	mkdir build/res
	cp -a res build

clean: 
	rm -f build/run.exe
	rm -f -r build/res