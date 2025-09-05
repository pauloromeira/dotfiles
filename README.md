# Dotfiles
Those files are managed by [pauloromeira/provision](https://github.com/pauloromeira/provision), but they can also be applied by running:
```sh
./stow.sh
```

## OS Specific
To add os-specific dotfiles, place a directory starting with `@` followed by the `OS_ID`,
under the desired app directory. You can use the following command, replacing `<APP_ID>`:
```sh
mkdir -p <APP_DIR>/@$(cat /etc/os-release | grep -Poh '^ID=\K.*')
```
Any files under this directory will only be applied to its related OS.

### Dependencies
- [GNU Stow](https://www.gnu.org/software/stow/)

### Ignoring files
Place a `.stow-local-ignore` under the dotfiles dir

### TODO
- [ ] Add stow action for `@etc` and other non-home config files

## References
- [Stow manual](https://www.gnu.org/software/stow/manual/stow.html)
