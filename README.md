# Homebrew Tap for Murmur

[Murmur](https://anubhavitis.github.io/murmur/) is a local speech-to-text app that lives in your macOS menubar. This is the official Homebrew tap for installing it.

## Install

```bash
brew tap anubhavitis/murmur
brew trust --tap anubhavitis/murmur
brew install --cask murmur
```

Homebrew 6 refuses to load casks from third-party taps until you trust them, so
the `brew trust` step is required. Trust is stored per-machine in
`~/.homebrew/trust.json`.

## Upgrade

```bash
brew upgrade --cask murmur
```

If this fails with `Refusing to load cask ... from untrusted tap`, run the
`brew trust` command above first.

## What it does

- Downloads Murmur for Apple Silicon
- Installs `Murmur.app` to `/Applications`
- Registers a LaunchAgent so Murmur starts automatically on login
- Logs output to `~/.murmur/murmur.log`
- Stores speech models in `~/.murmur/models/`

## Uninstall

```bash
brew uninstall --cask murmur
```

To also remove all Murmur data:

```bash
brew zap murmur
```

## Requirements

- macOS on Apple Silicon (arm64)
- [Homebrew](https://brew.sh)

## Links

- [Main repo](https://github.com/anubhavitis/murmur)
- [Website](https://anubhavitis.github.io/murmur/)
