# My void linux configs

## Installer utilities

I made some utilities to install void from the live image with full disk
encryption and easy secure boot support thanks to UKIs.

You can find them in `void-installer-utils`.

The names of the scripts are self explanatory.

## Configs

Once you've installed the system and rebooted into it you can run the
hardware/software-configs scripts which will setup the system further.

### Software configs

Each config includes a deploy script and files that will be symlinked to your
system with GNU stow.

For example if you only want a barebones system you can execute
`software-configs/base/base.sh`. This This will run the necessary commands and
symlink `software-configs/base/files` to your system.

If you want my tiling window manager setup you only need to execute
`software-configs/wm/wm.sh`. This will script calls `base.sh` before doing it's
thing. You can think of it as inheritance.

### Hardware configs

Some configurations steps are hardware dependent, these go in
`hardware-configs`. For example if you have a laptop with an Nvidia GPU and
another with an AMD GPU, you don't want to install the Nvidia drivers on the AMD
one and vice versa.

Also you probably know what software config you want to run on your different
hardware setups so you can call a script from `software-configs` at the end of
you hardware config. For example at the end of `hardware-configs/fac/fac.sh` I
call `software-configs/wm/wm.sh` because I want my `wm` setup on my `fac` system.

### Why GNU stow?

Since files are symlinked you will be able to edit them
as normal while also changing the config files in the git repo. This ensures
you don't loose config changes because you forgot to copy your changes back to
the repo after changing a config.

