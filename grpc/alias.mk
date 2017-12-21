
SYMBOLIC_FLAGS  := -r -s

GRPCXX_BASE     := grpc++_1.3.2
GRPCXX          := grpc++

GRPC_BASE       := grpc_3.0.0
GRPC            := grpc

all debug release build:
	@echo "Start building $@"

ifneq ($(GRPCXX), $(wildcard $(GRPCXX)))
	ln $(SYMBOLIC_FLAGS) $(GRPCXX_BASE) $(GRPCXX)
endif

ifneq ($(GRPC), $(wildcard $(GRPC)))
	ln $(SYMBOLIC_FLAGS) $(GRPC_BASE) $(GRPC)
endif

	@echo "Finished building $@"

clean:
	rm -f $(GRPCXX)
	rm -f $(GRPC)
	@echo " "

rebuild: build

.PHONY:clean rebuild
