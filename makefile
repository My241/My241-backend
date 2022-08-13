CC = go build
CFLAGS =

SRCDIR = src
OBJDIR = obj
BINDIR = bin
LIBDIR = lib

all : $(BINDIR)/app

# Events binary
$(OBJDIR)/business_events_broker : $(SRCDIR)/business_events_broker.go
	mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -o $(OBJDIR)/business_event_broker.go $(SRCDIR)/business_events_broker.go 


# App binary
$(BINDIR)/app : $(OBJDIR)/business_events_broker
	#mkdir -p $(BINDIR)
	#$(CC) $(CFLAGS) -c $(OBJDIR)/business_event_broker -o $(BINDIR)/app
	# It should link all the binaries into the app binary... when we create more bins
	mv $(OBJDIR)/business_event_broker $(BINDIR)/app
	chmod 111 $(BINDIR)/app


# Run app
run : $(BINDIR)/app
	$(BINDIR)/app


# Clean compilation objects
.PHONY : clean
clean :
	rm -rf $(OBJDIR) $(BINDIR) $(LIBDIR)
