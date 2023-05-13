# sh-config 💾

_The backups for my shell configurations._

You're welcome, future me!

### Usage

#### Adding these configurations to your Linux distro for the first time?

First, make this repo publicly visible.

Then, run the following commands, _separately_ (testing with Ubuntu on WSL2 has routinely failed as a single command, for whatever reason). The first makes some temporary directories, clones this repo into them, and sources a `.sh-config_aliases` file that contains the prerequisite commands:

```shell
mkdir ~/.custom/ &&
mkdir ~/builds/ &&
cd ~/builds &&
git clone https://github.com/nescioquid/sh-config.git
```

And the second copy-pastes the configurations from the now-local repo and sources the new `.bashrc` file:

```shell
installconfig
```

Then, you should run `aliases` and make sure you're `source` -ing whatever aliases you want in your new environment.

_Don't forget to make this repo private again afterwards!_

#### Else

Push to this repo with `backupconfig` and pull from it with `retrieveconfig`. Remember to run it whenever you make any configuration changes!
