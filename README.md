# dotfiles

Personal dotfiles, managed with [yadm](https://yadm.io/). yadm tracks files
directly in `$HOME` using a bare git repo at `~/.local/share/yadm/repo.git` —
there's no special dotfiles directory to `cd` into, just run `yadm` instead
of `git` from anywhere.

## New machine setup

```sh
yadm clone https://github.com/soofaloofa/dotfiles.git
```

This checks out all tracked files into `$HOME`. If a `~/.config/yadm/bootstrap`
script exists, run it after cloning:

```sh
yadm bootstrap
```

## Everyday commands

| Command | What it does |
| --- | --- |
| `yadm status` | What's changed vs. what's tracked |
| `yadm diff` | Show the actual changes |
| `yadm add <path>` | Stage a file (e.g. `yadm add ~/.zshrc`) |
| `yadm commit -m "..."` | Commit staged changes |
| `yadm push` | Push to GitHub |
| `yadm pull` | Pull + fast-forward on another machine |
| `yadm list` | List all tracked files |

> **Note:** this repo has `status.showUntrackedFiles no` set (yadm's default,
> since `$HOME` is full of unrelated files). That means a brand-new dotfile
> is invisible to `yadm status`/`yadm diff` until you `yadm add` it — if you
> add a new config file, you have to remember to add it explicitly, `yadm
> status` won't remind you.

## Tracking a new file for the first time

```sh
yadm add ~/.config/nvim/init.lua
yadm commit -m "track nvim config"
yadm push
```

## Syncing changes from another machine

```sh
yadm pull
```

If yadm reports a conflict, resolve it like a normal git conflict
(`yadm diff`, edit, `yadm add`, `yadm commit`).

## Encrypting sensitive files

yadm can encrypt files with gpg before committing them, controlled by a
`~/.config/yadm/encrypt` file listing globs (e.g. `.ssh/config`, `.netrc`,
`.aws/config`). Useful for machine-specific secrets you still want backed up.

```sh
yadm encrypt   # encrypt files listed in ~/.config/yadm/encrypt -> ~/.local/share/yadm/archive
yadm decrypt   # decrypt after a fresh clone
```

Not currently set up in this repo — worth adding if you ever want to track
credentials/config files that shouldn't be committed in plaintext.
