
SYMBOLIC_FLAGS  := -r -s

PROTOBUF_BASE   := protobuf_3.3.0
PROTOBUF        := protobuf

all debug release build:
	@echo "Start building $@"

ifneq ($(PROTOBUF), $(wildcard $(PROTOBUF)))
	ln $(SYMBOLIC_FLAGS) $(PROTOBUF_BASE) $(PROTOBUF)
endif

	@echo "Finished building $@"

clean:
	rm -f $(PROTOBUF)
	@echo " "

rebuild: build

.PHONY:clean rebuild
