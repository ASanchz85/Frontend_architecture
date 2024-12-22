# Bash Script - Frontend Folder Structure

This is a bash script to create a custom folder structure for medium/larger react ts projects. It tries to keep a clean architecture for frontend development.

There are several scripts depending on how big your project will be. Small, medium, and large. Together with them, we have something in between mid/large named midLarge.

Apart from that, I've created a simple menu to allow you pick the right choice. For doing so, you need to follow the steps below.

Once executed, just follow the steps prompted in your terminal.

## How to use it?

After clone it, give it execution permissions with chmod +x

```sh
chmod +x front_init.sh
```

After doing so, you can create an alias or add it to your binaries for easing execution from any folder

```sh
sudo mv front_init.sh /usr/local/bin/front_init
```

For execution you should just "call it" within your workspace directory (example below presumes that your alias is the same as the script filename)

```sh
front_init
```

In case, you prefer to set an alias (change .bashrc to .zshrc in case your terminal is a ZSH) Be aware that /path/to/ needs to be modified according to your local routes and preferences

```sh
nano ~/.bashrc
```

alias front_init="~/path/to/front_init.sh"
You can rename front_init alias for the one more convenient to you.

```sh
source ~/.bashrc
```

*Happy hacking!!*
