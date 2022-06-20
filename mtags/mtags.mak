#!/usr/bin/make -f

CTAGS := ctags
CSCOPE := cscope

sources := $(shell \
	{ git ls-files && git ls-files --others --exclude-standard ; } \
	| while IFS=" " read -r line _; do [ -f "$$line" ] && echo "$$line"; done)
ctags_in := $(filter %.c %.h %.cpp %.hpp %.cxx %.hxx %.cc \
	%.py %.sh %.vim %.java %.lua %.rb %.js %.pl %.rs %.tcl %.php, \
	$(sources))
cscope_in := $(filter %.c %.h %.cpp %.hpp %.cxx %.hxx %.cc,$(ctags_in))
$(shell mkdir -p .mtags)

.PHONY: all
all: tags
ifneq ($(cscope_in),)
all: cscope.out
endif

.PHONY: clean
clean:
	@rm -rf .mtags tags cscope.out cscope.out.in cscope.out.po

tags: .mtags/header $(ctags_in:%=.mtags/tags/%.tags)
	$(info merging $@)
	@# use file function, in case the list is too long to be passed as
	@# arguments
	$(file >.mtags/sort.in.list,$^)
	@# convert space separated list of files (with trailing new line) into a
	@# null separated list of files, which can be used by sort
	@tr ' \n' '\0\0' < .mtags/sort.in.list > .mtags/sort.in
	@# merge all the individually sorted ctags files
	@LC_ALL=C sort --merge --output=.mtags/ctags --files0-from=.mtags/sort.in
	@# atomically update the tags file
	@mv .mtags/ctags $@

.mtags/header:
	$(info generating header)
	@# parsing an empty file generates only the header
	@$(CTAGS) --languages='' -f $@ /dev/null

.mtags/tags/%.tags: %
	$(info tagging $<)
	@mkdir -p $(@D)
	@# writing to stdout disables header generation
	@$(CTAGS) -f - "$<" > "$@"

cscope.out: $(cscope_in)
	$(info cscope $@)
	$(file >.mtags/cscope.in)
	$(foreach f,$^,$(file >>.mtags/cscope.in,$f))
	@# -b: build database without launching browser
	@# -q: additionally create inverted index
	@# -k: don't include /usr/include
	@# -i: file containing list of source files
	@# -f: output database
	@$(CSCOPE) -b -q -k -i .mtags/cscope.in -f .mtags/cscope.out
	@cp .mtags/cscope.out .mtags/cscope.out.in .mtags/cscope.out.po .

# disable implicit rules
.SUFFIXES:
