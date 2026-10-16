# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

chezmoi keeps two copies of your configuration:

- **Home directory:** the files your applications use, such as `~/.bashrc`.
- **Source directory:** this Git repository, normally `~/.local/share/chezmoi`.
  chezmoi stores `~/.bashrc` as `dot_bashrc` and `~/.config` as `dot_config`.

`chezmoi add` copies files from home into the repo. `chezmoi apply` writes the
repo's configuration back to home. Commit and push to back up changes on GitHub;
this repo's chezmoi configuration disables automatic commits and pushes.

## Add and back up dotfiles

On a machine where this repo is already initialized, add an existing file:

```sh
chezmoi add ~/.bashrc
```

To add a directory and its contents instead:

```sh
chezmoi add --recursive ~/.config/zed
```

Use home-directory paths with chezmoi; it handles the source filenames for you.
Adding a file updates the local repo only. To back it up remotely, enter the
source directory and commit the files you added:

```sh
chezmoi cd
git status --short
git diff -- dot_bashrc
git add -- dot_bashrc
git diff --cached
git commit -m "chore(bash): back up shell configuration"
git push
exit
```

For the Zed example, use `dot_config/zed` in the Git commands and a suitable
commit message. Review newly added files before staging them; `git diff` does
not show untracked files. `chezmoi cd` starts a shell in the source directory,
and `exit` returns to your previous shell.

## Update dotfiles in the repo

Edit the repo's copy through chezmoi, using the corresponding home path:

```sh
chezmoi edit ~/.bashrc
chezmoi diff ~/.bashrc
chezmoi --dry-run --verbose apply ~/.bashrc
chezmoi apply ~/.bashrc
```

`chezmoi edit` changes the source file. The application-facing file changes when
you run `chezmoi apply`. You can also edit `dot_bashrc` directly in this repo,
then use the same preview and apply commands.

If you already edited `~/.bashrc` directly, capture that version in the repo:

```sh
chezmoi add ~/.bashrc
```

Then use the commit-and-push steps above to save either kind of update.
`git diff` shows changes in the repo; `chezmoi diff` shows what applying the
repo would change in your home directory. Capture home-directory edits before
applying if you want to keep them.

## Install dotfiles on a new laptop

Install Git and curl with your system's package manager. Then install chezmoi
with the [official installer](https://www.chezmoi.io/install/):

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
chezmoi --version
```

Ensure `~/.local/bin` is also in your shell's PATH for future sessions.
Set up a GitHub SSH key with access to this repo, then clone it through chezmoi:

```sh
chezmoi init git@github.com:eagleusb/dotfiles.git
```

This initializes the source directory without applying the dotfiles. Review
the changes against the laptop's existing files, then apply them:

```sh
chezmoi diff
chezmoi --dry-run --verbose apply
chezmoi apply
```

Restart your shell or affected applications to load their new configuration.

## Pull updates on an existing laptop

First capture, commit, and push any local changes you want to keep using the
steps above. Then pull the latest repo changes, preview them, and apply:

```sh
chezmoi git pull -- --rebase
chezmoi diff
chezmoi apply
```

If Git reports a conflict or the pull fails, resolve it before applying.
When you want to pull and apply immediately, use the shortcut:

```sh
chezmoi update
```

See chezmoi's [quick start](https://www.chezmoi.io/quick-start/) and
[daily operations](https://www.chezmoi.io/user-guide/daily-operations/) for more
examples.
