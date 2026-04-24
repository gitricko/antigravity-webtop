ARG ANTIGRAVITY_VERSION=0.1.1

# Use your preferred Webtop flavor as the base (e.g., Ubuntu, Alpine)
FROM lscr.io/linuxserver/webtop:ubuntu-mate

# Install prerequisites
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    wget \
    htop \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

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
COPY --chown=abc:abc Antigravity.desktop /custom-cont-init.d/Antigravity.desktop
COPY --chown=abc:abc init-antigravity.sh /custom-cont-init.d/init-antigravity.sh
