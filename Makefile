all:
	@echo "cleaning..."
	@make clean
	@echo "cleaning success"
	@echo "building..."
	@make build
	@echo "build success"
	@echo "post building..."
	@make post_build
	@echo "post build success"

build:
	@swiftc -o bin/main src/main.swift src/files.swift src/chets.swift src/transactions.swift

post_build:
	@mkdir bin/data
	@cp -r data bin/

clean:
	@rm -rf bin
	@mkdir bin

run:
	@./bin/main $(do) $(chetname)