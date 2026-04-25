# ideAI-webtop
A safe, isolated WebTop for engineers and product managers to run agent-enabled IDE workflows without touching their host/root machine.

<p align="center">
  <strong>Run agent-based coding, installs, and configuration in a VM sandbox instead of on your local computer</strong>
</p>

<p align="center">
  <a href="LICENSE">
    <img src="https://img.shields.io/github/license/gitricko/ideai-webtop" alt="License">
  </a>
  <a href="https://github.com/gitricko/ideai-webtop/issues">
    <img src="https://img.shields.io/github/issues/gitricko/ideai-webtop" alt="GitHub issues">
  </a>
</p>

## What this repo is for

`ideai-webtop` provides a browser-accessible VM desktop where engineers and product managers can safely run agent-based IDEs, demos, and automation flows. Instead of installing agent tooling on your host system, this project contains the entire workspace in an isolated Docker/Codespaces environment.

This makes it possible to give an agent full permission to:
- create and edit code
- install packages and tools
- modify configuration files
- run terminal commands

...without exposing your local machine or root environment to those actions.

## Who should use it

- Engineers validating agent-driven development workflows
- Product managers testing AI-assisted prototyping safely
- Teams building Claude Code, Codex, Antigravity, or other agent-enabled environments
- Anyone who wants a disposable sandbox for experiments that can be destroyed cleanly

## Why this exists

Local installs for agent-based IDEs are risky because agents often need broad access to code, tooling, and configuration. That can lead to accidental host-level changes, broken dependency trees, or security gaps on a personal machine.

This repo solves that by running the workspace in an isolated VM-backed WebTop. The agent can do whatever it needs inside the sandbox, but the host machine remains untouched.

## What you get

- A browser-accessible Ubuntu desktop environment
- Preconfigured WebTop startup for agent tooling and demos
- Docker-based persistence for files and config
- Optional GitHub Codespaces support for private browser access
- Local Docker support for running the same environment on your own machine
- Optional mountpoints where this webtop can access one of your host folder (likely code workspace) so that you can co-develop using native IDE in own machine for editing and running plan session where agents of the IDE runs on the VM

## Quick start

### Recommended environment

- GitHub account with Codespaces enabled, or
- Local Docker engine available
- Recommended: 4 CPU cores and 16 GB RAM for your docker/codespace environment

### Start in Codespaces

1. Open this repository in a GitHub Codespace.
2. In the Codespace terminal, run:
   ```bash
   make start
   ```
3. Wait for the web desktop URL to appear in the Ports tab.
4. Open the URL and use the desktop environment.

Once running, you can launch the WebTop applications and start testing agent workflows safely inside the sandbox.

## Features

- Support IDEs are **Google Antigravity** and **OpenAI Codex**
- **Isolated sandbox**: runs in a VM/Docker environment, not on your host OS
- **Agent-friendly**: safe place for tools that install, configure, or write code
- **Browser access**: use the desktop from a browser window via Codespaces or local port forwarding
- **Persistent workspace**: Docker volumes preserve files and settings between restarts
- **Backup/restore workflow**: keep or move your sandbox state with `make backup` and `make restore`
- **Portable**: same Docker setup can be moved to a VPS or another environment

## Security model

This repo is designed to keep the risky parts of agent experimentation away from your root machine.

- The environment runs in an **isolated VM or container**.
- Ports are forwarded privately through GitHub Codespaces when using `make start`.
- The browser endpoint is protected by GitHub authentication.
- The sandbox is ephemeral: deleting the Codespace removes the environment.
- Local Docker use keeps the agent workload contained inside a container.

> The goal is safe experimentation: let agents install, configure, and run freely inside the sandbox, while your personal machine stays unchanged.

## Example use cases

- Prototype a Codex or Antigravity workflow in an isolated environment
- Test an AI assistant that needs to install dependencies or configure build tooling
- Run demos for product stakeholders without modifying your laptop
- Validate agent-based code generation inside a disposable workspace

## Backup & restore

The workspace state is persisted in a Docker volume. Use these commands to save and restore that state:

```bash
make backup          # creates backup/ideai_webtop_config_backup.tar.gz
make restore         # restores from backup/ideai_webtop_config_backup.tar.gz
```

### Migration flow

1. Run `make backup` in the current environment.
2. Download the generated file from `backup/`.
3. Place it in the `backup/` folder of the new environment.
4. Run `make restore`.

**Tip:** Back up before making major changes. Restore overwrites existing sandbox state.

## Run locally

If you prefer not to use Codespaces, you can run the environment with local Docker.

```bash
make docker-build
make start-locally-baked
```

This is useful for self-hosted testing or when you want the same sandbox on your own machine.

## Contributing

Contributions, issues, and feature requests are welcome. If you want this repo to support additional agent IDE demos or tighter sandboxing patterns, open an issue.

## License

MIT — see [LICENSE](./LICENSE)
