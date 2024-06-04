FROM docker.io/rust:1.78-bookworm

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --extra-conf "sandbox = false" \
    --init none \
    --no-confirm

RUN cargo install cargo-nextest \
 && cargo install cargo-hack \
 && rm -rf /usr/local/cargo/registry
