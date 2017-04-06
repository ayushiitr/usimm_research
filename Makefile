
OUT = usimm
OUT1 = usimm_cpp
BINDIR = ../bin
OBJDIR = ../obj
OBJS = $(OBJDIR)/main.o $(OBJDIR)/memory_controller.o $(OBJDIR)/scheduler.o
SOURCE = main.c
CC = g++
DEBUG = -g
CFLAGS = -std=gnu++11 -Wall $(DEBUG) -fpermissive
LFLAGS = -Wall $(DEBUG)


$(BINDIR)/alwaysmake: $(SOURCE)
	$(CC) $(CFLAGS) $(SOURCE) -Dvanilla -o $(BINDIR)/$(OUT1)_vanilla
	$(CC) $(CFLAGS) $(SOURCE) -Drl -o $(BINDIR)/$(OUT1)_rl
	chmod 777 $(BINDIR)/$(OUT1)_vanilla
	chmod 777 $(BINDIR)/$(OUT1)_rl


#$(BINDIR)/$(OUT): $(OBJS)
#	$(CC) $(LFLAGS) $(OBJS) -o $(BINDIR)/$(OUT)
#	chmod 777 $(BINDIR)/$(OUT)
#
#$(OBJDIR)/main.o: main.c processor.h configfile.h memory_controller.h scheduler.h params.h
#	$(CC) $(CFLAGS) main.c -o $(OBJDIR)/main.o
#	chmod 777 $(OBJDIR)/main.o
#
#$(OBJDIR)/memory_controller.o: memory_controller.c utlist.h utils.h params.h memory_controller.h scheduler.h processor.h
#	$(CC) $(CFLAGS) memory_controller.c -o $(OBJDIR)/memory_controller.o
#	chmod 777 $(OBJDIR)/memory_controller.o
#
#$(OBJDIR)/scheduler.o: scheduler.c scheduler.h utlist.h utils.h memory_controller.h params.h
#	$(CC) $(CFLAGS) scheduler.c -o $(OBJDIR)/scheduler.o
#	chmod 777 $(OBJDIR)/scheduler.o
#
clean:
	rm -f $(BINDIR)/$(OUT) $(OBJS)
	rm -f $(BINDIR)/*

