CC = go build
CFLAGS =

SRCDIR = src
OBJDIR = obj
BINDIR = bin
LIBDIR = lib

all : $(BINDIR)/app


$(OBJDIR)/business_events_broker : $(SRCDIR)/business_events_broker.go
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $(OBJDIR)/business_event_broker $(SRCDIR)/business_events_broker.go 



$(BINDIR)/app : $(OBJDIR)/business_events_broker
	mv -f $(OBJDIR)/business_event_broker $(BINDIR)/app
	chmod 111 $(BINDIR)/app


run : $(BINDIR)/app
	$(BINDIR)/app



.PHONY : clean
clean :
	rm -rf $(OBJDIR) $(BINDIR) $(LIBDIR)
