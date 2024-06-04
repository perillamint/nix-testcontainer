FROM docker.io/rust:1.78-bookworm

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux \
    --extra-conf "sandbox = false" \
    --init none \
    --no-confirm

RUN cargo install cargo-nextest \
 && cargo install cargo-hack \
 && cargo install cargo-machete \
 && cargo install typos-cli \
 && rm -rf /usr/local/cargo/registry

# Install node and yarn
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash
RUN apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*
RUN npm install --global yarn
