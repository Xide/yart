
RM = rm -f

doc:
	@rustdoc src/main.rs --crate-name yart

clean:
	@echo "Removing documentation artifacts"
	@$(RM) -r doc
	@echo "Removing build targets"
	@$(RM) -r target

lint:
	@cargo fmt
	@cargo clippy

build.debug:
	@cargo build

build.release:
	@cargo build --release

build.docker:
	@docker build -t yart .

build: build.release

tooling.stable: .circleci/Dockerfile
	@docker build -t tooling --build-arg toolchain="stable" .circleci

tooling: tooling.stable


.PHONY: clean lint tooling.stable tooling build.debug build.release build.docker build
