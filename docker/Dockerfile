# Builder stage: Build Codex app
FROM lscr.io/linuxserver/webtop:ubuntu-mate AS codex-builder

ARG BUILDARCH
RUN echo "Building for architecture: $BUILDARCH"

# Install build dependencies only
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    nodejs \
    git \
    make \
    build-essential \
    p7zip-full curl unzip \
    && rm -rf /var/lib/apt/lists/*

# Build Codex Desktop App
RUN npm install -g @openai/codex
RUN cd /tmp \
    && git clone https://github.com/ilysenko/codex-desktop-linux \
    && cd /tmp/codex-desktop-linux \
    && if [ "$BUILDARCH" = "amd64" ]; then \
        curl -o Codex.dmg https://persistent.oaistatic.com/codex-app-prod/Codex-latest-x64.dmg; \
    elif [ "$BUILDARCH" = "arm64" ]; then \
        curl -o Codex.dmg https://persistent.oaistatic.com/codex-app-prod/Codex.dmg; \
    fi \
    && make build-app \
    && mv codex-app /usr/share

# Antigravity stage: Install Antigravity
FROM lscr.io/linuxserver/webtop:ubuntu-mate AS antigravity-builder

# Add Google Antigravity Repository and Signing Key
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | \
    gpg --dearmor --yes -o /etc/apt/keyrings/antigravity-repo-key.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/antigravity-repo-key.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | \
    tee /etc/apt/sources.list.d/antigravity.list > /dev/null

# Update and install Google Antigravity
RUN apt-get update && apt-get install -y \
    antigravity \
    && rm -rf /var/lib/apt/lists/*

# Final stage: Runtime image
FROM lscr.io/linuxserver/webtop:ubuntu-mate

ARG BUILDARCH
RUN echo "Building for architecture: $BUILDARCH"

# Install runtime prerequisites (exclude build tools)
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    wget \
    htop \
    ca-certificates \
    unzip \
    firefox \
    nodejs \ 
    && rm -rf /var/lib/apt/lists/*

# Copy built Codex from codex-builder stage
COPY --from=codex-builder /usr/share/codex-app /usr/share/codex-app
RUN npm install -g @openai/codex

# Copy Antigravity install from antigravity-builder stage
COPY --from=antigravity-builder /usr/share/antigravity /usr/share/antigravity

# Place the desktop shortcut and init script so they auto-start on desktop load
RUN mkdir -p /custom-cont-init.d
COPY --chown=abc:abc common.sh /custom-cont-init.d/common.sh
COPY --chown=abc:abc *.desktop /custom-cont-init.d/
COPY --chown=abc:abc init-ide.sh /custom-cont-init.d/init-ide.sh
