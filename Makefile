.PHONY: build
build:
	cargo build --release --target x86_64-unknown-linux-musl
	zip -j bootstrap.zip ./target/x86_64-unknown-linux-musl/release/bootstrap
