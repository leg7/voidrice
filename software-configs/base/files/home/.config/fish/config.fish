set -gx LESS "R" # Less default options (inhibits git from calling less with -F and -R)
set -gx BROWSER "firefox"
set -gx EDITOR "nvim"

set -gx ASAN_OPTIONS "halt_on_error=0"
set -gx FZF_DEFAULT_OPTS "--ansi --layout reverse --color fg:-1,fg+:-1,bg:-1,bg+:-1,hl:-1,hl+:-1,query:-1,gutter:-1"

# XDG

set -gx XDG_CACHE_HOME "$HOME/.local/cache"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx PATH "$PATH:$HOME/.local/bin"
if test -z "$XDG_RUNTIME_DIR"
	set -gx XDG_RUNTIME_DIR (mktemp -d "$XDG_STATE_HOME/$(id -u)-runtime-dir.XXX")
end

set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass"
set -gx MBSYNCRC "$XDG_CONFIG_HOME/isync/mbsyncrc"
set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -gx GHCUP_USE_XDG_DIRS "true"
set -gx STARSHIP_CACHE "$XDG_CACHE_HOME/starship"
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"
set -gx WINEPREFIX "$XDG_DATA_HOME/wine"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx ANDROID_USER_HOME "$XDG_DATA_HOME/android"
set -gx GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"
set -gx LEIN_HOME "$XDG_DATA_HOME/lein"
set -gx _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

set -U fish_greeting

if status is-interactive
	if test (tty) = "/dev/tty1"
		dbus-run-session river
	end

	starship init fish | source
end
