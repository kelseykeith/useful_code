## How to Use `sshfs`

### Setup

1. Install homebrew by going to <https://brew.sh/> and following the instructions there
2. Install osxfuse using homebrew. Enter the command `brew install --cask macfuse` in the terminal. If you already have osxfuse installed, but want/need to update to the newer version, do `brew uninstall osxfuse` followed by `brew install macfuse`
3. Check to see if `sshfs` is installed by typing `sshfs --help` into terminal. If you get a help message, you're good! If not install `sshfs` through homebrew by entering `brew install sshfs` in the terminal.

### Connect Mac Filesystem to Remove Server Using `sshfs`

The command is `sshfs YOURUSERNAME@IPADDRESS:/PATH/TO/MOUNT/ON/REMOTE/SERVER ~/PATH/TO/MOUNT/LOCALLY -o follow_symlinks`. Be aware that the entire local file path must exist initially.

Example: `sshfs kkeith@10.1.105.11:/home/kkeith/ ~/Volumes/cbix_kkeith -o follow_symlinks`

To unmount, use the `umount` command followed by the path to where the volume is mounted.

Example `mount ~/Volumes/cbix_kkeith/`
