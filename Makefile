
ifndef CFLAGS
CFLAGS := -O0 -g -std=gnu99 -pipe
CFLAGS += 
else
CFLAGS := -O2 -std=gnu99 -pipe
endif

CFLAGS += -Wall -Wno-unused-result -Wno-unused-label -Wformat-security
CFLAGS += -fPIC -fstack-protector --param=ssp-buffer-size=4

LIBNAME := libelfhook.a
OBJDIR := objdir
OBJS := elf_hook.o
OBJS := $(addprefix $(OBJDIR)/, $(OBJS))

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	$(AR) crus $(LIBNAME) $(OBJS)

$(OBJDIR)/%.o: %.c | $(OBJDIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJDIR):
	mkdir -p $(OBJDIR)

install:

clean:
	rm -rf $(OBJDIR) $(LIBNAME) *.so test
