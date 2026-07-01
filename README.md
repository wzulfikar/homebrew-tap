# homebrew-tap

Homebrew tap for [wzulfikar](https://github.com/wzulfikar) apps.

## Install

```sh
brew install --cask wzulfikar/tap/ccdeck
```

Or add the tap first, then install:

```sh
brew tap wzulfikar/tap
brew install --cask ccdeck
```

## Casks

| Cask | Description |
|------|-------------|
| [`ccdeck`](Casks/ccdeck.rb) | macOS menu bar app that juggles multiple Claude subscriptions for Claude Code |

## Releasing a new version

The cask points at a notarized DMG published as a GitHub release of
[`wzulfikar/ccdeck`](https://github.com/wzulfikar/ccdeck).

1. In the `ccdeck` repo, cut the release (builds, notarizes, publishes the DMG):

   ```sh
   ./scripts/release.sh v0.1.0
   ```

2. In this repo, bump the cask to that version (downloads the DMG, computes the
   sha256, rewrites the cask):

   ```sh
   ./bin/bump-cask v0.1.0
   brew audit --cask Casks/ccdeck.rb
   git commit -am "ccdeck v0.1.0" && git push
   ```

Until the first release exists the cask uses `sha256 :no_check`; `bump-cask`
replaces it with a real hash.
