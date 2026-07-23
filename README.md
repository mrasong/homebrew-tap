# homebrew-tap

Homebrew tap for [TimothyYe/godns](https://github.com/TimothyYe/godns) — a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel.

## Supported Platforms

- macOS (Apple Silicon / Intel)
- Linux (ARM64 / AMD64)

## Install

```bash
brew install mrasong/tap/godns
```

## Configure

Intel Mac / Linux:

```bash
vi /usr/local/etc/godns.yaml
```

Apple Silicon Mac:

```bash
vi /opt/homebrew/etc/godns.yaml
```

See [godns sample config](https://github.com/TimothyYe/godns/blob/master/config.yaml) for available options.

## Service

```bash
brew services start godns
brew services stop godns
brew services restart godns
```

## Auto Update

Formula is automatically updated via GitHub Actions when a new godns release is published. See [workflow](.github/workflows/update-godns.yml).
