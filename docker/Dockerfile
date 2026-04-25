# ARG ANTIGRAVITY_VERSION=0.1.1

# Use your preferred Webtop flavor as the base (e.g., Ubuntu, Alpine)
FROM lscr.io/linuxserver/webtop:ubuntu-mate

ARG BUILDARCH
RUN echo "Building for architecture: $BUILDARCH"

# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    wget \
    htop \
    ca-certificates \
    python3 \
    p7zip-full curl unzip \
    build-essential \
    firefox \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Codex Desktop App
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
    && mv codex-app /usr/share/codex-app

# https://github.com/ilysenko/codex-desktop-linux
# https://persistent.oaistatic.com/codex-app-prod/Codex.dmg
# https://persistent.oaistatic.com/codex-app-prod/Codex-latest-x64.dmg
# make build-app


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

# Place the desktop shortcut and init script so they auto-start on desktop load
RUN mkdir -p /custom-cont-init.d
COPY --chown=abc:abc common.sh /custom-cont-init.d/common.sh
COPY --chown=abc:abc *.desktop /custom-cont-init.d/
COPY --chown=abc:abc init-ide.sh /custom-cont-init.d/init-ide.sh
