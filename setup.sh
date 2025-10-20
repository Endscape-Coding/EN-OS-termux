#!/data/data/com.termux/files/usr/bin/bash

## Author  : Aditya Shakya (adi1090x) | Fork for Endscape
## Mail    : adi1090x@gmail.com | endscape.coding@gmail.com
## Github  : @adi1090x | @Endscape
## Twitter : @adi1090x | None
## Telegram: none | https://t.me/Linux_EN_OS

## Termux Desktop : Setup GUI in Termux 

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

## Reset terminal colors
reset_color() {
	printf '\033[37m'
}

## Script Termination
exit_on_signal_SIGINT() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Banner
banner() {
	clear
	cat <<- EOF
${RED}	            ┌──────────────────────────┐
${BLUE}				   ░█▀▀░█▀█░░░░░█▀█░█▀▀░░  
${BLUE}	               ░█▀▀░█░█░▄▄▄░█░█░▀▀█░░  
${BLUE}				   ░▀▀▀░▀░▀░░░░░▀▀▀░▀▀▀░░  
${RED}                ─────────────────────────────
${GREEN}	░▀█▀░█▀▀░█▀▄░█▄█░█░█░█░█░░░█▀▄░█▀▀░█▀▀░█░█░▀█▀░█▀█░█▀█
${GREEN}	░░█░░█▀▀░█▀▄░█░█░█░█░▄▀▄░░░█░█░█▀▀░▀▀█░█▀▄░░█░░█░█░█▀▀
${GREEN}	░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░░▀▀░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░░
${RED} └──────────────────────────────────────────────────────────┘
        ${BLUE}By : Endscape // @Endscape
 
    cat <<- EOF
		${RED}┌──────────────────────────────────────────────────────────┐
		${RED}│${GREEN}░░░▀█▀░█▀▀░█▀▄░█▄█░█░█░█░█░░░█▀▄░█▀▀░█▀▀░█░█░▀█▀░█▀█░█▀█░░${RED}│
		${RED}│${GREEN}░░░░█░░█▀▀░█▀▄░█░█░█░█░▄▀▄░░░█░█░█▀▀░▀▀█░█▀▄░░█░░█░█░█▀▀░░${RED}│
		${RED}│${GREEN}░░░░▀░░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░░▀▀░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░░░░${RED}│
		${RED}└──────────────────────────────────────────────────────────┘
		
	EOF
}

## Show usages
usage() {
	banner
	echo -e ${ORANGE}"\nInstall GUI (Openbox Desktop) on Termux"
	echo -e ${ORANGE}"Usages : $(basename $0) --install | --uninstall \n"
}

## Update, X11-repo, Program Installation
_pkgs=(bc bmon calc calcurse curl dbus desktop-file-utils elinks feh fontconfig-utils fsmon \
		geany git gtk2 gtk3 htop imagemagick jq leafpad mandoc mpc mpd mutt ncmpcpp \
		ncurses-utils neofetch netsurf obconf-qt openbox openssl-tool polybar ranger rofi \
		startup-notification termux-api thunar tigervnc vim wget xarchiver xbitmaps xcompmgr \
		xfce4-settings xfce4-terminal xmlstarlet xorg-font-util xorg-xrdb zsh)

setup_base() {
	echo -e ${RED}"\n[*] Installing EN-OS Termux Desktop..."
	echo -e ${CYAN}"\n[*] Updating Termux Base... \n"
	{ reset_color; pkg autoclean; pkg update -y; pkg upgrade -y; }
	echo -e ${CYAN}"\n[*] Enabling Termux X11-repo... \n"
	{ reset_color; pkg install -y x11-repo; }
	echo -e ${CYAN}"\n[*] Installing required programs... \n"
	for package in "${_pkgs[@]}"; do
		{ reset_color; pkg install -y "$package"; }
		_ipkg=$(pkg list-installed $package 2>/dev/null | tail -n 1)
		_checkpkg=${_ipkg%/*}
		if [[ "$_checkpkg" == "$package" ]]; then
			echo -e ${GREEN}"\n[*] Package $package installed successfully.\n"
			continue
		else
			echo -e ${MAGENTA}"\n[!] Error installing $package, Terminating...\n"
			{ reset_color; exit 1; }
		fi
	done
	reset_color
}

## Setup OMZ and Termux Configs
setup_omz() {
	# backup previous termux and omz files
	echo -e ${RED}"[*] Setting up OMZ and termux configs..."
	omz_files=(.oh-my-zsh .termux .zshrc)
	for file in "${omz_files[@]}"; do
		echo -e ${CYAN}"\n[*] Backing up $file..."
		if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
			{ reset_color; mv -u ${HOME}/${file}{,.old}; }
		else
			echo -e ${MAGENTA}"\n[!] $file Doesn't Exist."			
		fi
	done
	# installing omz
	echo -e ${CYAN}"\n[*] Installing Oh-my-zsh... \n"
	{ reset_color; git clone https://github.com/robbyrussell/oh-my-zsh.git --depth 1 $HOME/.oh-my-zsh; }
	cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
	sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="aditya"/g' $HOME/.zshrc

	# ZSH theme
	cat > $HOME/.oh-my-zsh/custom/themes/aditya.zsh-theme <<- _EOF_
		# Default OMZ theme

		if [[ "\$USER" == "root" ]]; then
		  PROMPT="%(?:%{\$fg_bold[red]%}%{\$fg_bold[yellow]%}%{\$fg_bold[red]%} :%{\$fg_bold[red]%} )"
		  PROMPT+='%{\$fg[cyan]%}  %c%{\$reset_color%} \$(git_prompt_info)'
		else
		  PROMPT="%(?:%{\$fg_bold[red]%}%{\$fg_bold[green]%}%{\$fg_bold[yellow]%} :%{\$fg_bold[red]%} )"
		  PROMPT+='%{\$fg[cyan]%}  %c%{\$reset_color%} \$(git_prompt_info)'
		fi

		ZSH_THEME_GIT_PROMPT_PREFIX="%{\$fg_bold[blue]%}  git:(%{\$fg[red]%}"
		ZSH_THEME_GIT_PROMPT_SUFFIX="%{\$reset_color%} "
		ZSH_THEME_GIT_PROMPT_DIRTY="%{\$fg[blue]%}) %{\$fg[yellow]%}✗"
		ZSH_THEME_GIT_PROMPT_CLEAN="%{\$fg[blue]%})"
	_EOF_
	# Append some aliases
	cat >> $HOME/.zshrc <<- _EOF_
		#------------------------------------------
		alias l='ls -lh'
		alias ll='ls -lah'
		alias la='ls -a'
		alias ld='ls -lhd'
		alias p='pwd'

		#alias rm='rm -rf'
		alias u='cd $PREFIX'
		alias h='cd $HOME'
		alias :q='exit'
		alias grep='grep --color=auto'
		alias open='termux-open'
		alias lc='lolcat'
		alias xx='chmod +x'
		alias rel='termux-reload-settings'

		#------------------------------------------

		# SSH Server Connections

		# linux (Arch)
		#alias arch='ssh UNAME@IP -i ~/.ssh/id_rsa.DEVICE'

		# linux sftp (Arch)
		#alias archfs='sftp -i ~/.ssh/id_rsa.DEVICE UNAME@IP'
	_EOF_

	# configuring termux
	echo -e ${CYAN}"\n[*] Configuring Termux..."
	if [[ ! -d "$HOME/.termux" ]]; then
		mkdir $HOME/.termux
	fi
	# copy font
	cp $(pwd)/files/.fonts/icons/dejavu-nerd-font.ttf $HOME/.termux/font.ttf
	# color-scheme
	cat > $HOME/.termux/colors.properties <<- _EOF_
		background 		: #263238
		foreground 		: #eceff1

		color0  			: #263238
		color8  			: #37474f
		color1  			: #ff9800
		color9  			: #ffa74d
		color2  			: #8bc34a
		color10 			: #9ccc65
		color3  			: #ffc107
		color11 			: #ffa000
		color4  			: #03a9f4
		color12 			: #81d4fa
		color5  			: #e91e63
		color13 			: #ad1457
		color6  			: #009688
		color14 			: #26a69a
		color7  			: #cfd8dc
		color15 			: #eceff1
	_EOF_
	# button config
	cat > $HOME/.termux/termux.properties <<- _EOF_
		extra-keys = [ \\
		 ['ESC','|', '/', '~','HOME','UP','END'], \\
		 ['CTRL', 'TAB', '=', '-','LEFT','DOWN','RIGHT'] \\
		]	
	_EOF_
	# change shell and reload configs
	{ chsh -s zsh; } \
	&& { echo -e "${GREEN}Changed shell to /bin/zsh"; } \
	|| { echo -e "${MAGENTA}Failed to change shell. Please run $ chsh -s zsh"; }

	{ termux-reload-settings; } \
	&& { echo -e "${GREEN}Settings reloaded successfully"; } \
	|| { echo -e "${MAGENTA}Failed to run $ termux-reload-settings. Restart app after installation is complete"; }

	{ termux-setup-storage; } \
	&& { echo -e "${GREEN}Ran termux-setup-storage successfully, you should now have a ~/storage folder"; } \
	|| { echo -e "${MAGENTA}Failed to execute $ termux-setup-storage"; }
}

## Configuration
setup_config() {
	# ensure /etc/machine-id exists for xfce4-settings
	# ref: issue #110 - https://github.com/adi1090x/termux-desktop/issues/110
	#
	# Check if ${PREFIX}/etc/machine-id exists, if not, generate it
	if [[ $(find ${PREFIX}/etc/ -type f -name machine-id | wc -l) == 0 ]]; then
		dbus-uuidgen --ensure=/data/data/com.termux/files/usr/etc/machine-id
		machineUUID=$(cat ${PREFIX}/etc/machine-id)
		echo -e ${CYAN}"\n[*] Generated UUID: ${machineUUID}"
		reset_color
	fi

	# backup
	configs=($(ls -A $(pwd)/files))
	echo -e ${RED}"\n[*] Backing up your files and dirs... "
	for file in "${configs[@]}"; do
		echo -e ${CYAN}"\n[*] Backing up $file..."
		if [[ -f "$HOME/$file" || -d "$HOME/$file" ]]; then
			{ reset_color; mv -u ${HOME}/${file}{,.old}; }
		else
			echo -e ${MAGENTA}"\n[!] $file Doesn't Exist."			
		fi
	done
	
	# Copy config files
	echo -e ${RED}"\n[*] Copiyng config files... "
	for _config in "${configs[@]}"; do
		echo -e ${CYAN}"\n[*] Copiyng $_config..."
		{ reset_color; cp -rf $(pwd)/files/$_config $HOME; }
	done
	if [[ ! -d "$HOME/Desktop" ]]; then
		mkdir $HOME/Desktop
	fi
}

## Setup VNC Server
setup_vnc() {
	# backup old dir
	if [[ -d "$HOME/.vnc" ]]; then
		mv $HOME/.vnc{,.old}
	fi
	echo -e ${RED}"\n[*] Setting up VNC Server..."
	{ reset_color; vncserver -localhost; }
	sed -i -e 's/# geometry=.*/geometry=1366x768/g' $HOME/.vnc/config
	cat > $HOME/.vnc/xstartup <<- _EOF_
		#!/data/data/com.termux/files/usr/bin/bash
		## This file is executed during VNC server
		## startup.

		# Launch Openbox Window Manager.
		openbox-session &
	_EOF_
        chmod u+rx $HOME/.vnc/xstartup
	if [[ $(pidof Xvnc) ]]; then
		    echo -e ${ORANGE}"[*] Server Is Running..."
		    { reset_color; vncserver -list; }
	fi
}

## Create Launch Script
setup_launcher() {
    local file="$HOME/.local/bin/startdesktop"
    local display=":1"
    local vnc_port="5901"
    
    # Создаем директорию если не существует
    mkdir -p "$(dirname "$file")"
    
    # Удаляем старый файл если существует
    [[ -f "$file" ]] && rm -f "$file"
    
    echo -e "${RED}\n[*] Creating Launcher Script...${NC}"
    
    # Создаем скрипт запуска
    cat > "$file" << _EOF_
#!/data/data/com.termux/files/usr/bin/bash

# Colors for output
RED='\033[1;31m'
GREEN='\033[1;32m'
ORANGE='\033[1;33m'
NC='\033[0m'

# Export Display
export DISPLAY="$display"

cleanup_vnc() {
    echo -e "\${ORANGE}[*] Cleaning up VNC temp files...\${NC}"
    rm -rf /tmp/.X11-unix/X1
    rm -rf /tmp/.X1-lock
    rm -rf \$HOME/.vnc/*.log
    rm -rf \$HOME/.vnc/*.pid
}

start_vnc_server() {
    echo -e "\${GREEN}[*] Starting VNC Server on display $display (port $vnc_port)...\${NC}"
    
    # Очищаем старые temp файлы перед запуском
    cleanup_vnc
    
    # Запускаем VNC сервер с фиксированным портом
    vncserver "$display" -geometry 1280x720 -depth 24 -name "termux-desktop"
    
    if [[ \$? -eq 0 ]]; then
        echo -e "\${GREEN}[+] VNC Server started successfully\${NC}"
        echo -e "\${ORANGE}[*] Connect using: localhost:$vnc_port\${NC}"
    else
        echo -e "\${RED}[!] Failed to start VNC Server\${NC}"
        # Пытаемся убить зависшие процессы и перезапустить
        killall Xvnc 2>/dev/null
        sleep 2
        cleanup_vnc
        vncserver "$display" -geometry 1280x720 -depth 24
    fi
}

stop_vnc_server() {
    echo -e "\${ORANGE}[*] Stopping VNC Server...\${NC}"
    vncserver -kill "$display" 2>/dev/null
    killall Xvnc 2>/dev/null
    cleanup_vnc
    echo -e "\${GREEN}[+] VNC Server stopped\${NC}"
}

# Проверяем, запущен ли VNC сервер
if pgrep -f "Xvnc.*$display" > /dev/null; then
    echo -e "\${ORANGE}\n[!] VNC Server is already running on $display\${NC}"
    echo -e "\${GREEN}[*] Active VNC sessions:\${NC}"
    vncserver -list
    
    echo
    read -p "Do you want to restart VNC server? (y/N): " choice
    case "\$choice" in
        y|Y)
            stop_vnc_server
            sleep 2
            start_vnc_server
            ;;
        *)
            echo -e "\${GREEN}[*] Keeping current session running\${NC}"
            ;;
    esac
else
    # Проверяем наличие старых lock файлов
    if [[ -f "/tmp/.X1-lock" ]] || [[ -f "\$HOME/.vnc/$(hostname):1.pid" ]]; then
        echo -e "\${ORANGE}[!] Found stale lock files, cleaning up...\${NC}"
        cleanup_vnc
    fi
    
    start_vnc_server
fi

echo -e "\${GREEN}[*] Done!\${NC}"
_EOF_

    # Устанавливаем права выполнения
    chmod +x "$file"
    
    if [[ -f "$file" ]]; then
        echo -e "${GREEN}[*] Script ${ORANGE}$file ${GREEN}created successfully.${NC}"
    else
        echo -e "${RED}[!] Failed to create script $file${NC}"
        return 1
    fi
    
    # Добавляем PATH если еще не добавлен
    local path_entry="export PATH=\"\${PATH}:\${HOME}/.local/bin\""
    if ! grep -q "export PATH.*\.local/bin" "${PREFIX}/etc/profile"; then
        echo "$path_entry" >> "${PREFIX}/etc/profile"
        echo -e "${GREEN}[*] \$PATH reference ${ORANGE}~/.local/bin ${GREEN}added to /etc/profile successfully.${NC}"
    else
        echo -e "${ORANGE}[*] \$PATH reference already exists in /etc/profile${NC}"
    fi
    
    # Создаем алиас для удобства
    if ! grep -q "alias startdesktop" "${PREFIX}/etc/bash.bashrc" 2>/dev/null; then
        echo "alias startdesktop='~/.local/bin/startdesktop'" >> "${PREFIX}/etc/bash.bashrc"
    fi
    
    echo -e "${GREEN}[+] Setup completed! You can now run 'startdesktop'${NC}"
}

## Finish Installation
post_msg() {
	echo -e ${GREEN}"\n[*] ${RED}Termux Desktop ${GREEN}Installed Successfully.\n"
	cat <<- _MSG_
		[-] Restart termux and enter ${ORANGE}startdesktop ${GREEN}command to start the VNC server.
		[-] In VNC client, enter ${ORANGE}127.0.0.1:5901 ${GREEN}as Address and Password you created to connect.	
		[-] To connect via PC over Wifi or Hotspot, use it's IP, ie: ${ORANGE}192.168.43.1:5901 ${GREEN}to connect. Also, use TigerVNC client.	
		[-] Make sure you enter the correct port. ie: If server is running on ${ORANGE}Display :2 ${GREEN}then port is ${ORANGE}5902 ${GREEN}and so on.
		  
	_MSG_
	{ reset_color; exit 0; }
	
	# replace the current session's shell with zsh
	exec ${PREFIX}/bin/zsh
}

## Install Termux Desktop
install_td() {
	banner
	setup_base
	setup_omz
	setup_config
	setup_vnc
	setup_launcher
	post_msg
}

## Uninstall Termux Desktop
uninstall_td() {
	banner
	# remove pkgs
	echo -e ${RED}"\n[*] Unistalling Termux Desktop..."
	echo -e ${CYAN}"\n[*] Removing Packages..."
	for package in "${_pkgs[@]}"; do
		echo -e ${GREEN}"\n[*] Removing Packages ${ORANGE}$package \n"
		{ reset_color; apt-get remove -y --purge --autoremove $package; }
	done
	
	# delete files
	echo -e ${CYAN}"\n[*] Deleting config files...\n"
	_homefiles=(.fehbg .icons .mpd .ncmpcpp .fonts .gtkrc-2.0 .mutt .themes .vnc Music)
	_configfiles=(Thunar geany  gtk-3.0 leafpad netsurf openbox polybar ranger rofi xfce4)
	_localfiles=(bin lib 'share/backgrounds' 'share/pixmaps')
	for i in "${_homefiles[@]}"; do
		if [[ -f "$HOME/$i" || -d "$HOME/$i" ]]; then
			{ reset_color; rm -rf $HOME/$i; }
		else
			echo -e ${MAGENTA}"\n[!] $file Doesn't Exist.\n"
		fi
	done
	for j in "${_configfiles[@]}"; do
		if [[ -f "$HOME/.config/$j" || -d "$HOME/.config/$j" ]]; then
			{ reset_color; rm -rf $HOME/.config/$j; }
		else
			echo -e ${MAGENTA}"\n[!] $file Doesn't Exist.\n"			
		fi
	done
	for k in "${_localfiles[@]}"; do
		if [[ -f "$HOME/.local/$k" || -d "$HOME/.local/$k" ]]; then
			{ reset_color; rm -rf $HOME/.local/$k; }
		else
			echo -e ${MAGENTA}"\n[!] $file Doesn't Exist.\n"			
		fi
	done
	echo -e ${RED}"\n[*] Termux Desktop Unistalled Successfully.\n"
}

## Main
if [[ "$1" == "--install" ]]; then
	install_td
elif [[ "$1" == "--uninstall" ]]; then
	uninstall_td
else
	{ usage; reset_color; exit 0; }
fi
