GPLC=gplc

SOURCES=$(wildcard ./src/*.pl)
EXECUTABLE=./bin/datemesenpai

.PHONY: all bin clean

all: bin

bin: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES)
	$(GPLC) $(SOURCES) -o $(EXECUTABLE)

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm $(EXECUTABLE)
