
SYMBOLIC_FLAGS  := -r -s

CASSANDRA_BASE  := cassandra_2.7.0
CASSANDRA       := cassandra

EIGEN_BASE      := eigen_3.3.4
EIGEN           := eigen

MONOGOCXX_BASE  := mongocxx_3.1.1
MONOGOCXX       := mongocxx

UV_BASE         := uv_1.11.0
UV              := uv

GRPC_BASE       := grpc_3.0.0
GRPC            := grpc

all debug release build:
	@echo "Start building $@"

ifneq ($(CASSANDRA), $(wildcard $(CASSANDRA)))
	ln $(SYMBOLIC_FLAGS) $(CASSANDRA_BASE) $(CASSANDRA)
endif

ifneq ($(EIGEN), $(wildcard $(EIGEN)))
	ln $(SYMBOLIC_FLAGS) $(EIGEN_BASE) $(EIGEN)
endif

ifneq ($(MONOGOCXX), $(wildcard $(MONOGOCXX)))
	ln $(SYMBOLIC_FLAGS) $(MONOGOCXX_BASE) $(MONOGOCXX)
endif

ifneq ($(UV), $(wildcard $(UV)))
	ln $(SYMBOLIC_FLAGS) $(UV_BASE) $(UV)
endif

ifneq ($(GRPC), $(wildcard $(GRPC)))
	ln $(SYMBOLIC_FLAGS) $(GRPC_BASE) $(GRPC)
endif

	@echo "Finished building $@"

clean:
	rm -f $(CASSANDRA)
	rm -f $(EIGEN)
	rm -f $(MONOGOCXX)
	rm -f $(UV)
	rm -f $(GRPC)
	@echo " "

rebuild: build

.PHONY:clean rebuild
