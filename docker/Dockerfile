ARG ANTIGRAVITY_VERSION=0.1.1

# Use your preferred Webtop flavor as the base (e.g., Ubuntu, Alpine)
FROM lscr.io/linuxserver/webtop:ubuntu-mate

# Install Python 3 and pip, then install the antigravity package
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

ARG ANTIGRAVITY_VERSION
RUN python3 -m pip install --no-cache-dir --disable-pip-version-check --break-system-packages antigravity==${ANTIGRAVITY_VERSION}

# Place the desktop shortcut and init script so they auto-start on desktop load
RUN mkdir -p /custom-cont-init.d
COPY --chown=abc:abc common.sh /custom-cont-init.d/common.sh
COPY --chown=abc:abc Antigravity.desktop /custom-cont-init.d/Antigravity.desktop
COPY --chown=abc:abc init-antigravity.sh /custom-cont-init.d/init-antigravity.sh
