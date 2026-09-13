# homebrew-screenly-cli

Homebrew formulae for [Screenly CLI](https://github.com/Screenly/cli).

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

To bump, open a PR on a `release-YY.M.MICRO` branch that updates **both** the `tag:`
and the `version` field to the new `vYY.M.MICRO` tag. Nothing else in the formula
changes — the `url` points at the repo, not a release tarball, so there is no
`sha256` to recompute.

The full release procedure lives upstream in
[`Screenly/cli` README](https://github.com/Screenly/cli#releasing) and in that repo's
`cut-release` agent skill.
