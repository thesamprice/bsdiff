INC=-Isrc
EXEC=bsdiff
SRC = $(wildcard *.c)

OBJ = $(SRC:.c=.o)
CC_FLAGS += -DHAVE_CONFIG_H -I.  -g3 -O0 
#CC_FLAGS += --save-temps
LDFLAGS += -fPIC

all: bspatch bsdiff

bspatch: 
	@$(CC) $(CC_FLAGS) -DBSPATCH_EXECUTABLE $(LDFLAGS) -g3 -o $@ bspatch.c $(LIBPATH) $(LIBS)

bsdiff: 
	@$(CC) $(CC_FLAGS) -DBSDIFF_EXECUTABLE $(LDFLAGS) -g3 -o $@ bsdiff.c $(LIBPATH) $(LIBS)
#	@ar  $(OBJ)  $@ $(OBJ) $(LIBPATH) $(LIBS)

%.o: %.c
	@$(CC) $(CC_FLAGS) $(INC) -c -g3  $< -o $@ 
clean:
	$(RM) $(OBJ)
	$(RM) bsdiff
	$(RM) bspatch
