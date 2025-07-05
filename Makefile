# Discover submodules in the `external` directory
SUBMODULES := $(shell git config --file .gitmodules --get-regexp path | awk '{ print $$2 }')

.PHONY: all add update pull status clean

# Default target
all: status

# Update submodules                          
update:   
	@git submodule update --remote --merge

# Pull changes for the submodules
pull:                              
	@for d in $(SUBMODULES); do \
		(cd $$d && git pull); \
	done

# Show the status of submodules     
status:                                                                                                   
	@git submodule status

# Clean up untracked files in submodules                                                                                                                                                                             
clean:                                                                                                    
	@for d in $(SUBMODULES); do \                                                                          
		(cd $$d && git clean -fd); \                                                                      
	done
