DIR:=tetris
JACK_FILES:=$(wildcard $(DIR)/*.jack)
VM_FILES := $(JACK_FILES:.jack=.vm)

ifeq ($(OS),Windows_NT)
	COMPILER:=JackCompiler.bat
else
	COMPILER:=JackCompiler.sh
endif

tetris: $(VM_FILES)

$(DIR)/%.vm: $(DIR)/%.jack
	@$(COMPILER) $<

.PHONY: clean

clean:
	@rm -f $(DIR)/*.vm
