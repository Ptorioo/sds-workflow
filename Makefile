all: compile

compile: clean
	g++ -s  src/calculator.cpp src/main.cpp -o build/run

clean:
	rm -f build/run.exe