# Homebrew Tap for Murmur

[Murmur](https://anubhavitis.github.io/murmur/) is a local speech-to-text app that lives in your macOS menubar. This is the official Homebrew tap for installing it.

## Install

```bash
brew tap anubhavitis/murmur
brew install --cask murmur
```

## What it does

- Downloads the Murmur binary for Apple Silicon
- Installs it to `~/.murmur/bin/murmur`
- Registers a LaunchAgent so Murmur starts automatically on login
- Logs output to `~/.murmur/murmur.log`

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
