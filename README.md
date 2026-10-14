# Screenly CLI Homebrew Tap

[![Homebrew](https://img.shields.io/badge/dynamic/regex?url=https%3A%2F%2Fraw.githubusercontent.com%2FScreenly%2Fhomebrew-screenly-cli%2Fmaster%2FFormula%2Fscreenly-cli.rb&search=tag%3A%20%22v(.*)%22&replace=v%241&label=homebrew)](Formula/screenly-cli.rb)
[![Screenly CLI](https://img.shields.io/github/v/release/Screenly/cli?label=screenly%2Fcli)](https://github.com/Screenly/cli/releases/latest)

The official [Homebrew](https://brew.sh) tap for the [Screenly CLI](https://github.com/Screenly/cli),
a command-line tool for managing Screenly digital signage (screens, assets, playlists,
Edge Apps) from your terminal.

## Install

```bash
brew tap screenly/screenly-cli
brew install screenly-cli
```

## Keeping this tap in sync

This repo is a downstream mirror: [`Screenly/cli`](https://github.com/Screenly/cli) is
the single source of truth for the version. `Formula/screenly-cli.rb` builds from a git
tag, so a release is only complete once the tag here matches the newest tag there.

Check for drift at any time:

```bash
# newest upstream release
gh release view --repo Screenly/cli --json tagName -q .tagName

# what this tap currently pins
grep 'tag:' Formula/screenly-cli.rb
```

To bump, open a PR on a `release-YY.M.MICRO` branch that updates the **`tag:`** — that
is the only line that changes. There is no explicit `version` field: Homebrew derives
the version from the tag (stripping the leading `v`, so tag `v26.9.0` gives version
`26.9.0`), which means it cannot drift out of step with the tag. And because `url`
points at the repo rather than a release tarball, there is no `sha256` to recompute.

> Don't reintroduce a `version "v..."` line. Homebrew sorts a leading `v` as a string
> token that ranks below any number, so a `v`-prefixed version compares as *older* than
> every bare one — `brew audit` rejects it outright
> ([`rubocops/version.rb`](https://github.com/Homebrew/brew/blob/master/Library/Homebrew/rubocops/version.rb)).

The full release procedure lives upstream in
[`Screenly/cli` README](https://github.com/Screenly/cli#releasing) and in that repo's
`cut-release` agent skill.
