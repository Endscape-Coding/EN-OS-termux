
---

### РУССКАЯ ВЕРСИЯ (RUSSIAN VERSION)

**`ПОСЛЕДНЕЕ ОБНОВЛЕНИЕ`** : `20.10.2025`
**`ОФИЦИАЛЬНЫЙ РЕПОЗИТОРИЙ`** : [https://github.com/Endscape-Coding/EN-OS-termux](https://github.com/Endscape-Coding/EN-OS-termux)

---

![logo](./previews/logo.png) <br />

[![Status](https://img.shields.io/badge/🟢-Active-brightgreen?style=for-the-badge)](#)
[![Version](https://img.shields.io/badge/v1.0.0-Stable-success?style=for-the-badge)](#)
[![Platform](https://img.shields.io/badge/Android-Termux-3DDC84?style=for-the-badge&logo=android)](#)
[![Desktop](https://img.shields.io/badge/Openbox-WM-FF6D00?style=for-the-badge&logo=linux)](#)

[![GitHub](https://img.shields.io/badge/Repo-EN--OS-6e48aa?style=for-the-badge&logo=github)](https://github.com/Endscape-Coding/EN-OS-termux)
[![Maintainer](https://img.shields.io/badge/By-Endscape-orange?style=for-the-badge)](#)
[![License](https://img.shields.io/badge/GPL-v3.0-blue?style=for-the-badge)](LICENSE)

## EN-OS Termux Desktop (Fork by Endscape)

Добро пожаловать в форк легендарного **Termux Desktop** — **EN/OS**! Этот проект начинался как коллекция файлов конфигурации от [adi1090x](https://github.com/adi1090x/termux-desktop), но теперь он получил второе дыхание под моим руководством, **Endscape**.

Моя цель — не просто поддерживать, а **активно развивать** этот проект, делая его ещё более стабильным, функциональным и удобным. Я исправляю найденные ошибки, актуализирую пакеты и понемногу добавляю новые фичи, чтобы ваш Linux-десктоп на Android был по-настоящему мощным рабочим местом в вашем кармане.

Итак, давайте начистоту: это набор **конфигурационных файлов** и **скриптов**, которые помогут вам развернуть графическую среду в **Termux**. Я постарался сделать процесс установки *максимально простым*, чтобы вы могли получить красивый ***Linux-десктоп на вашем Android-устройстве***. Следуйте инструкциям, и вы получите результат, похожий на этот: <br />

| Openbox WM | Светлая тема |
|--|--|
|![desktop](./previews/main_1.png)|![desktop](./previews/main_2.png)|

Начнём с самого начала... <br />

### Что такое Termux?

Termux — это *эмулятор терминала для Android* и приложение-**окружение Linux**, которое работает напрямую **без необходимости рута** или сложной настройки. Минимальная базовая система устанавливается автоматически — дополнительные пакеты доступны с помощью менеджера пакетов *PKG/APT*. Подробнее [здесь](https://termux.com/)... <br />

### Подготовка

Установите `Termux` и `Termux:API` на ваш телефон. Настоятельно рекомендуется установить *Termux API*, так как многие элементы рабочего стола зависят от него.

> Данная сборка создана и протестирована на:
>
> Устройство - **Redmi Note 9 Pro** <br />
> Android - **Android 10 (Q)** <br />
> Тип CPU - **aarch64**
> 
> Устройство - **Infinix note 30** <br />
> Android - **Android 15** <br />
> Тип CPU - **aarch64**

### Установка

После установки обоих приложений, откройте `Termux` и следуйте шагам ниже:

- Обновите пакеты Termux и установите `git`
```
pkg upgrade && pkg install git
```

- Клонируйте этот репозиторий
```
git clone --depth=1 https://github.com/Endscape-Coding/EN-OS-termux.git
```

> **Внимание**: Я предполагаю, что вы делаете это на чистой установке Termux. Если нет, я настоятельно рекомендую сделать именно так. Хотя скрипт `setup.sh` создаёт резервные копии всех заменяемых файлов, всё же рекомендуется вручную сделать бэкап ваших конфигураций, чтобы избежать конфликтов. <br />

- Перейдите в клонированную директорию и запустите `setup.sh` с опцией *--install*
```
cd EN-OS-termux
chmod +x setup.sh
./setup.sh --install
```

> Если скрипт `setup.sh` завершится ошибкой во время установки пакетов (из-за проблем с сетью), вы можете запустить его снова.

- Во время установки вас попросят установить пароль для **VNC** -
```
[*] Настройка VNC Сервера...

Вам потребуется пароль для доступа к вашему рабочему столу.

Пароль:
Подтвердите:
Установить пароль только для просмотра (y/n)? n
```

> Пароль не отображается при вводе. Минимальная длина пароля — 6 символов.
> Запомните ваш пароль, он потребуется для подключения через VNC-клиент.
- Если всё прошло успешно, вы увидите это сообщение -
```
New 'localhost:1 ()' desktop is localhost:1

Creating default startup script /data/data/com.termux/files/home/.vnc/xstartup
Creating default config /data/data/com.termux/files/home/.vnc/config
Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log

[*] Сервер запущен...

Сессии TigerVNC сервера:

X DISPLAY #     PROCESS ID
:1              XXXXX
```
> Это означает, что X (vnc) сервер запущен на дисплее 'localhost:1'. <br />

Готово! `EN/OS Termux Desktop` успешно установлен. *Перезапустите Termux* и введите команду `startdesktop` для запуска *vncserver* и последующего подключения через VNC-клиент. <br />
```
startdesktop

[*] Запуск VNC Сервера...

New 'localhost:1 ()' desktop is localhost:1

Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log
```

### Удаление

Если вы захотите удалить EN/OS Termux Desktop, просто запустите `setup.sh` с опцией *--uninstall*. Вы можете удалить клонированный репозиторий, чтобы сэкономить место, оставив только скрипт `setup.sh`. Команда ниже удалит все установленные пакеты и конфигурационные файлы, включая ваши изменения. Будьте осторожны!
```
./setup.sh --uninstall
```

***VNC Клиент***

Теперь вам нужно приложение VNC-клиент для подключения к серверу. Я использую этот клиент для Android: [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android). Вы можете использовать [TigerVNC](https://tigervnc.org/), если подключаетесь с компьютера (Windows или Linux).

Определите номер порта, на котором работает VNC-сервер. Он вычисляется так: 5900 + {номер дисплея}. Так, для дисплея 'localhost:1' порт будет 5901. <br />

Теперь откройте приложение VNC Viewer и создайте новое подключение с следующими параметрами (предполагая, что порт 5901) - <br />
```
Адрес:
127.0.0.1:5901

Имя:
EN/OS Termux
```
Запустите его. Вам будет предложено ввести `пароль`, установленный во время установки. После ввода пароля вы попадёте прямо на этот рабочий стол: <br />

![desktop](./previews/desk_1.png) <br />

### Первое впечатление

Давайте взглянем на предустановленные программы, которые вы здесь получите:

| Файловый менеджер | Текстовый редактор/IDE |
|--|--|
|![img](./previews/desk_2.png)|![img](./previews/desk_3.png)|

| Эмулятор терминала | Веб-браузер |
|--|--|
|![img](./previews/desk_4.png)|![img](./previews/desk_5.png)|

| Меню Openbox | Множество CLI-программ |
|--|--|
|![img](./previews/desk_6.png)|![img](./previews/desk_7.png)|

| vim & htop | ranger & calcurse | mutt & elinks | mpd & ncmpcpp |
|--|--|--|--|
|![img](./previews/desk_8.png)|![img](./previews/desk_9.png)|![img](./previews/desk_10.png)|![img](./previews/desk_11.png)|

Rofi - запускатор приложений и виджеты:

| Запускатор приложений | Музыкальный плеер |
|--|--|
|![img](./previews/rofi_1.png)|![img](./previews/rofi_2.png)|

| Статус батареи | Меню выхода | Сетевая информация |
|--|--|--|
|![img](./previews/rofi_3.png)|![img](./previews/rofi_5.png)|![img](./previews/rofi_4.png)|

### Стили

Всего в этой сборке доступно *Восемь различных стилей/тем*. Чтобы сменить стиль, `Нажмите правой кнопкой на рабочем столе > Preferences > Change Style` и выберите тот, который хотите применить.

| По умолчанию | Пляж | Лес | Сетка |
|--|--|--|--|
|![img](./previews/style_1.png)|![img](./previews/style_2.png)|![img](./previews/style_3.png)|![img](./previews/style_4.png)|

| Манхэттен | Слайм | Искра | Волна |
|--|--|--|--|
|![img](./previews/style_5.png)|![img](./previews/style_6.png)|![img](./previews/style_7.png)|![img](./previews/style_8.png)|

### Возможности `EN/OS Termux Desktop`

Вот несколько идей и вещей, которые вы можете делать с этим рабочим столом. От обучения программированию до пентеста, общения в IRC до веб-серфинга и загрузки файлов, от ретро-игр до запуска Windows из 90-х.

- Изучайте и практикуйте навыки программирования без ноутбука

| Python | Bash |
|--|--|
|![img](./previews/app_1.png)|![img](./previews/app_2.png)|

- Общение, веб-серфинг и загрузка файлов

| Hexchat & Pidgin | Netsurf & Uget | Просмотр Википедии |
|--|--|--|
|![img](./previews/app_3.png)|![img](./previews/app_4.png)|![img](./previews/app_5.png)|

- Тестирование на проникновение и изучение кибербезопасности

> Я не занимаюсь ничем **незаконным** и не пропагандирую **взлом**. *Termux — мощный инструмент, используйте его с умом и ответственностью.* <br />

| Metasploit - Sherlock - Socialfish - Zphisher - Sqlmap |
|--|
|![img](./previews/app_6.png)|

- Играйте в классические ретро-игры или запустите Microsoft Windows из 90-х с помощью `Dosbox`

| Turbo C++, Windows 1 и Windows 3 | Duke и Blue Brothers |
|--|--|
|![img](./previews/app_7.png)|![img](./previews/app_8.png)|

| Mario и Pacman | Prince of Persia (обе части) |
|--|--|
|![img](./previews/app_9.png)|![img](./previews/app_10.png)|

| Wolfenstein и Turrican2 | SuperKarts и Spiderman |
|--|--|
|![img](./previews/app_11.png)|![img](./previews/app_12.png)|

Вы, вероятно, поняли, какие возможности открываются перед вами с Termux и как EN/OS Termux Desktop делает этот процесс ещё проще.

### Сочетания клавиш

Вот несколько горячих клавиш для ускорения работы. Для полного списка: `Правая кнопка на рабочем столе > Keybinds`

| Клавиши | Действие |  | Клавиши | Действие |
|--|--|--|--|--|
| `W-1` | Перейти на Раб. Стол 1 |  |`S-W-1` | Отправить на Раб. Стол 1 |
| `W-2` | Перейти на Раб. Стол 2 |  |`S-W-2` | Отправить на Раб. Стол 2 |
| `W-3` | Перейти на Раб. Стол 3 |  |`S-W-3` | Отправить на Раб. Стол 3 |
| `W-4` | Перейти на Раб. Стол 4 |  |`S-W-4` | Отправить на Раб. Стол 4 |
| `W-5` | Перейти на Раб. Стол 5 |  |`S-W-5` | Отправить на Раб. Стол 5 |
||||||
| `W-S-Left` | Отправить на Пред. Стол |  | `W-S-Right` | Отправить на След. Стол |
| `A-Tab` | След. Окно (Текущий Стол) |  |`W-Tab` | След. Окно (Все Столы) |
||||||
| `W-h` | Переместить в Верх-Лево |  | `W-j` | Переместить в Низ-Лево |
| `W-k` | Переместить в Верх-Право |  | `W-l` | Переместить в Низ-Право |
| `W-Left` | К Левому Краю |  | `W-Right` | К Правому Краю |
| `W-Up` | Развернуть |  | `W-Down` | Свернуть |
||||||
| `W-q/c` | Закрыть Окно |  | `A-r/m` | Режим Изменения/Перемещения |
| `W-Space` | Меню Openbox |  | `W-p/A-F1` | Запускатор Приложений |
| `W-d` | Показать/Скрыть Раб. Стол |  | `W-v` | Список Задач |
||||||
| `W-f` | Файловый Менеджер |  | `W-e` | Текстовый Редактор |
| `W-t/return` | Терминал |  | `W-w` | Веб-Браузер |
| `W-x` | Меню Выхода |  | `W-m` | Музыкальное Меню |
| `W-b` | Меню Батареи |  | `W-n` | Сетевое Меню |
| `C-A-v` | Vim |  | `C-A-r` | Ranger |
| `C-A-h` | Htop |  | `C-A-n` | Nano |

### Дополнительные инструменты

Вы можете установить дополнительные инструменты для Termux, чтобы улучшить его внешний вид.
1. [Oh my zsh](https://github.com/adi1090x/termux-omz), Настройка zsh с фреймворком [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). (Уже включено в эту сборку)
2. [Termux style](https://github.com/adi1090x/termux-style), Смена цветов и шрифтов в Termux.

### Важная информация

- Если вы столкнулись с проблемой или ошибкой, создайте Issue в репозитории, и я постараюсь помочь.
- Отредактируйте `~/.local/bin/email`, указав свой Email и Пароль (используйте пароль приложения), чтобы показывать количество непрочитанных писем в polybar.
- Вам может потребоваться редактирование некоторых конфигов под ваши нужды (`~/.mutt/muttrc`, `~/.gitconfig`).
- Не пишите мне на почту или в ЛС с вопросами о том, как взламывать, я не хакер.
- Удачи! Делитесь этим репозиторием с друзьями.

---

### ENGLISH VERSION

**`LAST UPDATED`** : `August 2024`
**`OFFICIAL REPOSITORY`** : [https://github.com/Endscape-Coding/EN-OS-termux](https://github.com/Endscape-Coding/EN-OS-termux)

---

![logo](./previews/logo.png) <br />

<p align="center">
  <img src="https://img.shields.io/github/license/Endscape-Coding/EN-OS-termux?style=for-the-badge&label=License&color=blue">
  <img src="https://img.shields.io/github/v/release/Endscape-Coding/EN-OS-termux?style=for-the-badge&label=Version&color=green">
  <img src="https://img.shields.io/github/issues/Endscape-Coding/EN-OS-termux?color=violet&style=for-the-badge&label=Issues">
  <img src="https://img.shields.io/github/forks/Endscape-Coding/EN-OS-termux?color=teal&style=for-the-badge&label=Forks">
  <img src="https://img.shields.io/github/stars/Endscape-Coding/EN-OS-termux?style=for-the-badge&label=Stars">
</p>

## EN/OS Termux Desktop (Fork by Endscape)

Welcome to the fork of the legendary **Termux Desktop** — **EN/OS**! This project started as a collection of configuration files by [adi1090x](https://github.com/adi1090x/termux-desktop), but now it has been given a new lease on life under my maintenance, **Endscape**.

My goal is not just to maintain, but to **actively develop** this project, making it even more stable, functional, and user-friendly. I fix found bugs, update packages, and gradually add new features, so your Linux desktop on Android becomes a truly powerful workstation in your pocket.

Alright, let's be straight: these are just some **dotfiles** & **scripts**, which will help you to setup a graphical environment in **termux**. I've tried to make it *as easy as possible* to setup a beautiful ***linux desktop on your android device*** with termux. So follow the steps and you'll end up making it look like this - <br />

| Openbox WM | Light Theme |
|--|--|
|![desktop](./previews/main_1.png)|![desktop](./previews/main_2.png)|

Let's start from the beginning... <br />

### What is termux?

Termux is an *Android terminal emulator* and **Linux environment** app that works directly with **no rooting** or setup required. A minimal base system is installed automatically - additional packages are available using the *PKG/APT package manager*. More [Here](https://termux.com/)... <br />

### Preparation

Install `Termux` & `Termux:API` on your phone. It's highly recommended to install *Termux API* application as many desktop elements are dependent on it.

> This setup is created and tested on :
>
> Device - **Redmi Note 9 Pro** <br />
> Android - **Android 10 (Q)** <br />
> CPU Type - **aarch64**
> 
> Device - **Infinix Note 30** <br />
> Android - **Android 15** <br />
> CPU Type - **aarch64**

### Installation

After installing both applications above, open `Termux` and follow the steps below -

- Update termux packages and install `git`
```
pkg upgrade && pkg install git
```

- Clone this repository
```
git clone --depth=1 https://github.com/Endscape-Coding/EN-OS-termux.git
```

> **Warning** : I'm assuming that you're doing this on a fresh termux install. If not, I'll strongly suggest you to do so. Although the `setup.sh` script backs up every file it replaces, it's still recommended that you manually backup your configurations in order to avoid conflicts. <br />

- Change to cloned directory and run `setup.sh` with *--install* option
```
cd EN-OS-termux
chmod +x setup.sh
./setup.sh --install
```

> If script `setup.sh` fails during package installation (due to network issues), you can re-execute it again.

- During installation, you'll be asked to set up password for **VNC** -
```
[*] Setting up VNC Server...

You will require a password to access your desktops.

Password:
Verify:
Would you like to enter a view-only password (y/n)? n
```

> Note that passwords are not visible when you are typing them and minimum password length is 6 characters.
> Remember the password you typed as it'll be required to connect via vnc client.
- If everything is okay, you will see this message -
```
New 'localhost:1 ()' desktop is localhost:1

Creating default startup script /data/data/com.termux/files/home/.vnc/xstartup
Creating default config /data/data/com.termux/files/home/.vnc/config
Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log

[*] Server Is Running...

TigerVNC server sessions:

X DISPLAY #     PROCESS ID
:1              XXXXX
```
> It means that X (vnc) server is available on display 'localhost:1'. <br />

That's it. `EN/OS Termux Desktop` is installed successfully. *Restart Termux* and enter `startdesktop` command to start *vncserver* and connect via VNC Client. <br />
```
startdesktop

[*] Starting VNC Server...

New 'localhost:1 ()' desktop is localhost:1

Starting applications specified in /data/data/com.termux/files/home/.vnc/xstartup
Log file is /data/data/com.termux/files/home/.vnc/localhost:1.log
```

### Uninstallation

If you ever want to uninstall EN/OS Termux Desktop, just run `setup.sh` with *--uninstall* option. You can delete the cloned repository to save space, keeping only the `setup.sh` script. The command below will remove all the packages and delete all the config files it installed, including the changes you've made. So, Be careful there...
```
./setup.sh --uninstall
```

***VNC Client***

Now you need a VNC client app to connect to server. I'm using this Android VNC client: [VNC Viewer](https://play.google.com/store/apps/details?id=com.realvnc.viewer.android). You can use [TigerVNC](https://tigervnc.org/) if you're trying to connect to server by a computer (Windows or Linux).

Determine port number on which VNC server listens. It can be calculated like this: 5900 + {display number}. So for display 'localhost:1' the port will be 5901. <br />

Now open the VNC Viewer application and create a new connection with the following information (assuming that port is 5901) - <br />
```
Address:
127.0.0.1:5901

Name:
EN/OS Termux
```
Now launch it. You will be prompted for `password` that you entered during installation. After entering password, you'll be headed directly to this desktop - <br />

![desktop](./previews/desk_1.png) <br />

### First Impression

Let's take a look at following installed programs you'll get here -

| File Manager | Text Editor/IDE |
|--|--|
|![img](./previews/desk_2.png)|![img](./previews/desk_3.png)|

| Terminal Emulator | Web Browser |
|--|--|
|![img](./previews/desk_4.png)|![img](./previews/desk_5.png)|

| Openbox Menu | Many CLI based Programs |
|--|--|
|![img](./previews/desk_6.png)|![img](./previews/desk_7.png)|

| vim & htop | ranger & calcurse | mutt & elinks | mpd & ncmpcpp |
|--|--|--|--|
|![img](./previews/desk_8.png)|![img](./previews/desk_9.png)|![img](./previews/desk_10.png)|![img](./previews/desk_11.png)|

Rofi Application launcher and Applets -

| App Launcher | Music Player |
|--|--|
|![img](./previews/rofi_1.png)|![img](./previews/rofi_2.png)|

| Battery Status | Exit Menu | Network Info |
|--|--|--|
|![img](./previews/rofi_3.png)|![img](./previews/rofi_5.png)|![img](./previews/rofi_4.png)|

### Styles

There are total *Eight different styles/themes* available in this setup. To change style, `Right click on desktop > Preferences > Change Style` and select the one you want to apply.

| Default | Beach | Forest | Grid |
|--|--|--|--|
|![img](./previews/style_1.png)|![img](./previews/style_2.png)|![img](./previews/style_3.png)|![img](./previews/style_4.png)|

| Manhattan | Slime | Spark | Wave |
|--|--|--|--|
|![img](./previews/style_5.png)|![img](./previews/style_6.png)|![img](./previews/style_7.png)|![img](./previews/style_8.png)|

### Applications of `EN/OS Termux Desktop`

Well, These are some ideas or things you can do with termux desktop. From Learning coding to Penetration testing, Chatting over IRC to Browsing web and Downloading file, Playing classic retro games to run Windows from 90s.

- Learn and practice you coding skill without having a laptop

| Python | Bash |
|--|--|
|![img](./previews/app_1.png)|![img](./previews/app_2.png)|

- Chatting, Web Browsing and Downloading files

| Hexchat & Pidgin | Netsurf & Uget | Browsing Wiki |
|--|--|--|
|![img](./previews/app_3.png)|![img](./previews/app_4.png)|![img](./previews/app_5.png)|

- Penetration testing and Learn cyber security stuff

> I'm not doing anything **illegal** or sponsoring any kind of **Hacking and Cracking**. *Termux is a powerful tool, use it with responsibilities.* <br />

| Metasploit - Sherlock - Socialfish - Zphisher - Sqlmap |
|--|
|![img](./previews/app_6.png)|

- Play classic retro games or Run Microsoft Windows from 90s with `Dosbox`

| Turbo C++, Windows 1 and Windows 3 | Duke and Blue Brothers |
|--|--|
|![img](./previews/app_7.png)|![img](./previews/app_8.png)|

| Mario and Pacman | Prince of Persia (both) |
|--|--|
|![img](./previews/app_9.png)|![img](./previews/app_10.png)|

| Wolfenstein and Turrican2 | SuperKarts and Spiderman |
|--|--|
|![img](./previews/app_11.png)|![img](./previews/app_12.png)|

You'll probably get the idea of possible things you can do with Termux and how EN/OS Termux Desktop makes it more easy.

### Keybindings

Here's some shortcut keys you want to use to speed up your work. For more, `Right click on desktop > Keybinds`

| Keys | Action |  | Keys | Action |
|--|--|--|--|--|
| `W-1` | Go To Desktop 1 |  |`S-W-1` | Send To Desktop 1 |
| `W-2` | Go To Desktop 2 |  |`S-W-2` | Send To Desktop 2 |
| `W-3` | Go To Desktop 3 |  |`S-W-3` | Send To Desktop 3 |
| `W-4` | Go To Desktop 4 |  |`S-W-4` | Send To Desktop 4 |
| `W-5` | Go To Desktop 5 |  |`S-W-5` | Send To Desktop 5 |
||||||
| `W-S-Left` | Send To Prev Desktop |  | `W-S-Right` | Send To Next Desktop |
| `A-Tab` | Next Window (Current Workspace) |  |`W-Tab` | Next Window (All Workspaces) |
||||||
| `W-h` | Move to TopLeft |  | `W-j` | Move to BottomLeft |
| `W-k` | Move to TopRight |  | `W-l` | Move to BottomRight |
| `W-Left` | Move To Left Edge |  | `W-Right` | Move To Right Edge |
| `W-Up` | Maximized |  | `W-Down` | Unmaximized |
||||||
| `W-q/c` | Close Windows |  | `A-r/m` | Toggle Resize/Move |
| `W-Space` | Openbox Menu |  | `W-p/A-F1` | App Launcher |
| `W-d` | Toggle Desktop |  | `W-v` | Set Tasks |
||||||
| `W-f` | File Manager |  | `W-e` | Text Editor |
| `W-t/return` | Terminal |  | `W-w` | Web Browser |
| `W-x` | Exit Menu |  | `W-m` | Music Menu |
| `W-b` | Battery Menu |  | `W-n` | Network Menu |
| `C-A-v` | Vim |  | `C-A-r` | Ranger |
| `C-A-h` | Htop |  | `C-A-n` | Nano |

### Additional Tools

You can install additional tools for termux, to make it visually look good.
1. [Oh my zsh](https://github.com/adi1090x/termux-omz), Setup zsh with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework. (Already Added in this setup)
2. [Termux style](https://github.com/adi1090x/termux-style), Change color and fonts in termux.

### FYI

- If you face any problem or get any error, you can create an issue & i'll try to help.
- Edit `~/.local/bin/email` and put your Email ID and Password (Use an App password) to show unread mails on polybar.
- You may need to edit some config files accoring to your need (`~/.mutt/muttrc`, `~/.gitconfig`)
- Don't Email or DM me to ask how to hack, I ain't a Hacker.
- Have Fun, Share this repository with your friends.
