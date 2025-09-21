# My void linux configs

I made some utilities to install void with FDE and easy secure boot support
with the live image.

Once you've installed the system and rebooted into it you can run the
hardware/software-configs scripts which will setup the system further.

For example after installing the system I would always run `base.sh`, the
hardware-config for the computer I'm installing void to and finally `wm.sh`.

The config files are symlinked onto your system with GNU stow so that you can
edit them as usual but still easily manage changes from the git repo.
