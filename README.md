# sh-config 💾

_The backups for my shell configurations._

You're welcome, future me!

### Usage

#### Adding these configurations to your Linux distro for the first time?

First, make this repo publicly visible.

Then, run the following commands, _separately_ (testing with Ubuntu on WSL2 has routinely failed as a single command, for whatever reason). The first makes the right directory in the right location, clones this repo into it, and sources a `.sh-config_aliases` file that contains the prerequisite commands:

```shell
mkdir ~/builds/ && cd ~/builds &&
git clone https://github.com/nescioquid/sh-config.git &&
source ~/builds/sh-config/.custom/.sh-config_aliases
```

While the second actually installs the configurations:

```shell
installconfig
```

Afterwards, you should run `aliases` to make sure you're `source`-ing whatever aliases you want in your new environment.

_Don't forget to make this repo private again afterwards!_

#### Else

Push to this repo with `backupconfig` and pull from it with `retrieveconfig`. That's it! Remember to run `backupconfig` whenever you make any configuration changes!
