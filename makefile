
SERVICES_LIST := grpc
SERVICES_LIST += mongocxx
SERVICES_LIST += cassandra

all debug release build rebuild:
	$(MAKE) -f alias.mk $@

	@for item in $(SERVICES_LIST); \
	do \
		$(MAKE) -C $$item $@; \
	done

clean:
	@for item in $(SERVICES_LIST); \
	do \
		if [ -d $$item ]; then \
			$(MAKE) -C $$item $@ ; \
		fi \
	done
	$(MAKE) -f alias.mk $@