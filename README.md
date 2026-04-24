# 🚀 Antigravity — Web Top
_Run Google's Antigravity Easter Egg securely without breaking your bank._

<p align="center">
  <strong>Launch your antigravity securely without breaking your bank</strong>
</p>

<p align="center">
<a href="https://github.com/gitricko/antigravity-webtop/actions/workflows/docker-publish.yml">
    <img src="https://github.com/gitricko/antigravity-webtop/actions/workflows/docker-publish.yml/badge.svg" alt="Last Docker Image Push">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/gitricko/antigravity-webtop" alt="License">
  </a>
  <a href="https://github.com/gitricko/antigravity-webtop/issues">
    <img src="https://img.shields.io/github/issues/gitricko/antigravity-webtop" alt="GitHub issues">
  </a>
</p>

**Antigravity-WebTop** gives you a **fully functional Google Antigravity Easter Egg** in your browser in under 5 minutes — no powerful PC, no Docker on your machine, no GPU required.

Just open this repo in a GitHub Codespace and you get:
- A complete Ubuntu MATE desktop (WebTop)
- Python 3 pre-installed
- `antigravity` Python package globally installed
- Antigravity desktop shortcut placed and auto-started on the desktop
- Persistent volume for your config and files

When you're ready to go production, simply move the same Docker setup to your own machine or VPS.

## ✨ Why This Exists

The [`antigravity`](https://pypi.org/project/antigravity/) package is Google's famous Python Easter egg — `import antigravity` opens the classic [XKCD #353](https://xkcd.com/353/) comic ("Python flies") right in your browser. It's the original "Antigravity IDE" hidden inside Python itself.

This webtop gives you a cloud desktop where you can explore, demo, and celebrate Python's greatest Easter egg — completely in the browser via GitHub Codespaces.

Perfect for:
- Python educators and students showing off the language's sense of humor
- Anyone who wants a cloud desktop to experiment with Python
- Demos and presentations where you need a clean, isolated environment

## 🚀 Quick Start (5 minutes)

1. **Open this repository in a GitHub Codespace** (big green "Code" button → Codespaces → New)

   It is recommended that you use at least 2 CPU cores and 8 GB of RAM.

2. In the Codespace terminal run:
   ```bash
   make start
   ```
   (or `make start-locally-baked` if you prefer a pre-built image)

3. Wait ~60 seconds. When the web desktop URL appears in the Codespace Ports tab, click it.

4. Inside the WebTop desktop:
   - The **Antigravity** shortcut on the desktop will open a terminal and launch `python3 -c "import antigravity"`, which opens the XKCD comic in the browser.
   - You now have a **fully working Python + Antigravity environment running 100% in the cloud.**

## 🔧 Features

- **Zero local install** — everything runs in browser via GitHub Codespaces
- **Lightweight** — no Ollama, no ModelRelay, no GPU needed
- **Persistent config** — Docker volume backup and restore after Codespace recreation
- **Easy backup/restore** — `make backup` / `make restore`
- **One-command everything** — powerful Makefile + clean `docker-compose.yml`
- **Auto-placed desktop shortcut** — Antigravity appears on the desktop automatically
- **Colima / local Docker support** ready

## 🔒 Security: Protected by GitHub Authentication

**The WebTop URI is automatically protected — no one else can reach it.**

GitHub Codespaces forwards ports **privately by default** (this is the setting the `make start` command uses). According to official [GitHub documentation](https://docs.github.com/en/enterprise-cloud@latest/codespaces/reference/security-in-github-codespaces):

> "All forwarded ports are private by default, which means that you will need to authenticate before you can access the port."
> "Privately forwarded ports: Are accessible on the internet, but **only the codespace creator can access them, after authenticating to GitHub**."

### How the protection actually works
- The URL you click in the **Ports** tab (`https://<your-codespace>-3000.app.github.dev`) is guarded by **GitHub authentication cookies**.
- These cookies expire every **3 hours** — you'll simply be asked to log in again (super quick).
- If someone tries to open the link in an incognito window, via curl, or from another computer without being logged into **your** GitHub account, they are redirected to the GitHub login page or blocked.
- You (and only you) can access the full Ubuntu desktop and everything else.

### Extra security layers built-in
- The entire environment runs in an **isolated GitHub-managed VM** — not on your laptop.
- Codespaces are **ephemeral**: delete the codespace and everything disappears (except the backed-up volume you control).
- TLS encryption is handled automatically by GitHub.
- The `GITHUB_TOKEN` inside the codespace is scoped only to this repo and expires when you stop/restart.

**Bottom line**: This is actually **more secure** for experimentation than running Docker locally on your personal machine.

**For production use** we still recommend moving the same Docker image to your own VPS or server with additional hardening (firewall, HTTPS reverse proxy, strong secrets, etc.).

## 💾 Backup & Restore
Your configuration and files are persisted in a Docker volume.
The project includes convenient `make` targets to back up and restore this data in codespace:
```bash
make backup          # creates backup/antigravity_config_backup.tar.gz
make restore         # restores from backup/antigravity_config_backup.tar.gz
```

### When to Use It
- Migrating from GitHub Codespaces to a local machine or VPS
- Testing experimental changes without risking your current setup
- Quickly cloning your working environment into a fresh Codespace or container

### How to Migrate to a New Environment
- In your current environment, run `make backup`.
- Download the generated file: `backup/antigravity_config_backup.tar.gz`.
- Place the file in the `backup/` folder of the new environment.
- Run `make restore`.

**💡 Tip:** Always back up before making significant changes. The restore process will overwrite the existing volume data, so test in a separate environment first if you're unsure.

## 🛠️ Advanced Usage

Run locally (no Codespaces):
```bash
make docker-build            # build the image locally from ./docker/Dockerfile
make start-locally-baked     # start from your local baked image
```

## 🛣️ Roadmap

- [ ] Screenshots + video demo
- [ ] Pre-built Docker image tags for stable releases
- [ ] One-click "deploy to VPS" guide

## 🤝 Contributing
Feel free to open issues for bugs or feature requests.

## 📄 License
MIT — see [LICENSE](./LICENSE)