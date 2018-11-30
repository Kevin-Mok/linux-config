#!/bin/bash

# Shell rc file (i.e. bash vs. zsh, etc.)
shellrc="$HOME/.zshrc"

# Config locations
folders="$HOME/linux-config/key_dirs.txt"
configs="$HOME/.key_files"

# Output locations
shell_shortcuts="$HOME/.shortcuts"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"

# Remove
rm -f "$ranger_shortcuts" 2>/dev/null
echo "alias \\" > "$shell_shortcuts"

# Ensure text of argument 1 exists in the file argument 2
ensure() { (grep "$1" "$2")>/dev/null 2>&1 || echo "$1" >> "$2" ;}

ensure "source $shell_shortcuts" "$shellrc"
ensure "source $HOME/.config/ranger/shortcuts.conf" "$HOME/.config/ranger/rc.conf"

# Format the `folders` file in the correct syntax and sent it to all three configs.
sed "s/#.*$//;/^$/d" "$folders" | tee >(awk '{print $1"=\"cd "$2" && ls -a\" \\"}' >> "$shell_shortcuts") \
	| awk '{print "map g"$1" cd "$2"\nmap t"$1" tab_new "$2"\nmap m"$1" shell mv -v %s "$2"\nmap Y"$1" shell cp -rv %s "$2}' >> "$ranger_shortcuts"

# Format the `configs` file in the correct syntax and sent it to both configs.
sed "s/#.*$//;/^$/d"  "$configs" | tee >(awk '{print $1"=\"$EDITOR "$2"\" \\"}' >> "$shell_shortcuts") \
	| awk '{print "map "$1" shell $EDITOR "$2}' >> "$ranger_shortcuts"
