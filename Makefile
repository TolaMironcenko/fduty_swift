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

clean_release:
	@rm -rf release

build_release:
	@mkdir release
	@swiftc -o release/Dutys src/main.swift src/files.swift src/chets.swift src/transactions.swift

post_build_release:
	@mkdir release/data
	@cp -r data release/

releasing:
	@echo "cleaning..."
	@make clean_release
	@echo "cleaning success"
	@echo "building..."
	@make build_release
	@echo "build success"
	@echo "post building..."
	@make post_build_release
	@echo "post build success"