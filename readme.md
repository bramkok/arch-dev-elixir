# arch-dev-elixir
> Arch Linux Elixir development environment study

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Introduction](#introduction)
  - [Summary](#summary)
  - [Choices in tooling](#choices-in-tooling)
- [Setup](#setup)
  - [1. Vagrant](#1-vagrant)
    - [Installation](#installation)
    - [Download or clone repository](#download-or-clone-repository)
    - [Boot the environment](#boot-the-environment)
    - [Connect via SSH](#connect-via-ssh)
  - [2. Install packages](#2-install-packages)
    - [Add package repository](#add-package-repository)
    - [Update and install `yaourt`, `git`, `xsel` and `fish`](#update-and-install-yaourt-git-xsel-and-fish)
    - [Configure `fish` shell](#configure-fish-shell)
  - [3. Language installation](#3-language-installation)
    - [Install `pyenv` and `python`](#install-pyenv-and-python)
    - [Install `nvm` and `node`](#install-nvm-and-node)
  - [4. Install Neovim and plugins](#4-install-neovim-and-plugins)
    - [Install `nvim` and `client-neovim`](#install-nvim-and-client-neovim)
- [Arch Linux](#arch-linux)
  - [Commands](#commands)
    - [Package management](#package-management)
      - [Installing packages](#installing-packages)
      - [Updating packages](#updating-packages)
      - [Upgrading packages](#upgrading-packages)
  - [Original base box](#original-base-box)
    - [GitHub](#github)
    - [Atlas](#atlas)
    - [Release information](#release-information)
  - [Modified base box](#modified-base-box)
- [Neovim](#neovim)
- [Elixir Resources](#elixir-resources)
  - [Ecosystem](#ecosystem)
    - [Package management](#package-management-1)
    - [Application configuration](#application-configuration)
    - [Database](#database)
    - [Web frameworks](#web-frameworks)
      - [Phoenix Framework](#phoenix-framework)
      - [Other](#other)
    - [Testing](#testing)
    - [Code analysis and styleguides](#code-analysis-and-styleguides)
    - [Statistics and Metrics](#statistics-and-metrics)
    - [Data generation](#data-generation)
  - [Articles and blogs](#articles-and-blogs)
  - [Example projects](#example-projects)
  - [Misc](#misc)
    - [Game of Life](#game-of-life)
    - [Dev environments](#dev-environments)
  - [Neovim plugins](#neovim-plugins)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Introduction

### Summary

`arch-dev-elixir` is a development environment made for exploring and studying
the [Elixir](http://elixir-lang.org) language and ecosystem.

### Choices in tooling

| OPERATING SYSTEM                        | TEXT EDITOR                 | UI  |
| --------------------------------------- | --------------------------- | --- |
| [Arch Linux](https://www.archlinux.org) | [Neovim](https://neovim.io) | CLI |

## Setup

### 1. Vagrant

`arch-dev-elixir` runs inside a virtual machine that has been built with
[Vagrant](https://vagrantup.com).

#### Installation

There are many different virtualization platforms that are compatible with
Vagrant. The default option is [VirtualBox](https://www.virtualbox.org)
and should be installed alongside [Vagrant](https://vagrantup.com).

* [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Download Vagrant](https://www.vagrantup.com/downloads.html)
* [Vagrant documentation - Installation](https://www.vagrantup.com/docs/installation/)

#### Download or clone repository

```bash
$ git clone https://github.com/bramkok/arch-dev-elixir.git
```

#### Boot the environment

Change to the directory `arch-dev-elixir` and run `vagrant up`.

```bash
$ cd arch-dev-elixir && vagrant up
```

#### Connect via SSH

When the installation is finished and the machine is running, connect to
the machine via SSH.

```bash
$ vagrant ssh
```

### 2. Install packages

#### Add package repository

Open the Pacman configuration file.

```bash
$ sudo vi /etc/pacman.conf
```

Add the following repository at the end of the file.

```bash
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
```

Then save the file and close the editor.

#### Update and install `yaourt`, `git`, `postgresql`, `fish` et cetera

```bash
$ sudo pacman -Sy --noconfirm yaourt git xsel fish postgresql inotify-tools
```

#### Configure `fish` shell

```bash
# Change default shell to the `fish` shell
# When asked for a password use "vagrant"
$ chsh -s /usr/bin/fish

# Exit the current ssh session and reconnect again
$ exit
$ vagrant ssh

# Install a plugin manager for `fish`
$ curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# Install fish plugins with `fisher`
$ fisher mono z edc/bass pyenv git vibrant
```

### 3. Language installation

#### Install `pyenv` and `python`

```bash
# Install pyenv
$ yaourt -Sa --noconfirm pyenv

# Install Python 3.5.1
$ pyenv install 3.5.1

# Set Python 3.5.1 as global default
$ pyenv global 3.5.1

# Reload pyenv plugin for `fish`
$ source ~/.config/fish/conf.d/pyenv.fish
```

#### Install `nvm` and `node`

```bash
# Install nvm
$ yaourt -Sa --noconfirm nvm

# Install fish plugin
$ fisher install nvm

# Create directory
$ mkdir ~/.nvm

# Symlink nvm script
$ ln -s /usr/share/nvm/init-nvm.sh ~/.nvm/nvm.sh

# Install Node.js 6.3.0
$ nvm install v6.3.0

# Set Node.js 6.3.0 as global default
$ nvm nvm alias default v6.3.0
```

#### Install `erlang` and `elixir`

```bash
$ yaourt -S --noconfirm erlang elixir
```

### 4. Install Neovim and plugins

#### Install `nvim` and `client-neovim`

```bash
# Install Neovim
$ yaourt -S --noconfirm neovim

# Install Python 3 client for neovim
$ pip3 install --user --upgrade neovim
```

## Arch Linux

### Commands

#### Package management

##### Installing packages

Quick search + install.

```bash
$ yaourt [keywords]
```

Install package, Compile it from AUR if needed.

```bash
$ yaourt -S [packages]
```

Search on repos and on AUR (with notice for already installed packages).

```bash
$ yaourt -Ss [keywords]
```

Install packages by compiling from source (abs).

```bash
$ yaourt -Sb [packages]
```

Prompt for packages of the selected repos (emphasize those already installed).

```bash
$ yaourt -Sl [repos]
```

Colorized ouput of installed packages and the repos where they come from.

```bash
$ yaourt -Qs [keywords]
```

Shows the package which provides the program or the file.

```bash
$ yaourt -Qo [progname] or [filename]
```

##### Updating packages

Complete update of all Community, Core and Extra repositories.

```bash
$ yaourt -Sy
```

Complete update of all repositories + AUR repositories.

```bash
$ yaourt -Sya
```

##### Upgrading packages

Complete update and upgrade of all Community, Core and Extra repositories.

```bash
$ yaourt -Syu
```

Complete update and upgrade of all repositories + AUR repositories.

```bash
$ yaourt -Syau
```

### Original base box

The Arch Linux x86_64 Vagrant base box `bugyt/archlinux` has been used as the
starting point for this environment.

#### GitHub

[`bugyt/archlinux`](https://github.com/bugyt/archlinux)

#### Atlas

[`bugyt/archlinux`](https://vagrantcloud.com/bugyt/boxes/archlinux)

#### Release information

* Current ArchLinux Release: 2016.01.01
* Included Kernel: 4.3.3
* Details
  * Virtual Hard Disk Capacity 20GB, Dynamically allocated
  * Base package
  * Base devel package
  * Grub
  * Pacman package manager
  * OpenSSH
  * Users and passwords
     * root / vagrant
     * vagrant / vagrant (Public Key authentication with
			[Insecure Keypair](https://github.com/mitchellh/vagrant/tree/master/keys)
			, password-less sudo)
  * VirtualBox Guest Additions (for Virtualbox version)
  * __Network File System (NFS)__
  * __rsync__
  * __bash-completion__
  * __bash customizations__

### Modified base box

See packages and modifications in those steps.

* [2. Install packages](#2-install-packages)
* [3. Language installation](#3-language-installation)
* [4. Install Neovim and plugins](#4-install-neovim-and-plugins)

## Neovim

## Elixir Resources

### Ecosystem

#### Package management

- [Elixir Release Manager](https://github.com/bitwalker/exrm)
- [Elixir Make](https://github.com/elixir-lang/elixir_make)

#### Application configuration

- [Conform](https://github.com/bitwalker/conform)

#### Database

A database wrapper and language integrated query for Elixir

- [Ecto](https://github.com/elixir-ecto/ecto)

#### Web frameworks

##### Phoenix Framework

- [Phoenix Framework](http://www.phoenixframework.org)
  - [Phoenix Framework User Management](https://github.com/trenpixster/addict)

##### Other

- [Sugar Framework](https://sugar-framework.github.io)
- [trot Micro Framework](https://github.com/hexedpackets/trot)

#### Testing

- [Hound](https://hexdocs.pm/hound/readme.html)
- [ex_machina](https://hexdocs.pm/ex_machina) Create test data for Elixir applications
- [Wallaby](https://hexdocs.pm/wallaby) Concurrent browser tests with elixir
- [Blitzy](https://github.com/benjamintanweihao/blitzy)

#### Code analysis and styleguides

A community driven style guide for Elixir.

- [The Elixir Style Guide](https://github.com/niftyn8/elixir_style_guide)

A static code analysis tool for the Elixir language with a focus on code
consistency and teaching.

- [Credo](https://github.com/rrrene/credo)
- [Credo's Elixir Style Guide](https://github.com/rrrene/elixir-style-guide)

#### Statistics and Metrics

Statistics and Metrics library for Elixir.

- [Beaker](https://github.com/hahuang65/beaker)

#### Data generation

- [Faker](https://github.com/igas/faker)
- [Blacksmith](https://github.com/batate/blacksmith)

### Articles and blogs

- [Elixir Diary](https://code-shoily.github.io/my-elixir-diary)
- http://nithinbekal.com/posts/elixir-publish-package
- https://github.com/kblake/functional-programming
- http://learningelixir.joekain.com/posts/

### Example projects

- [xElixir](https://github.com/exercism/xelixir)
- [Elixir in action](https://github.com/sasa1977/elixir-in-action)
- http://elixir-examples.github.io

### Misc

#### Game of Life

Conway's game of life in Elixir.

- [Life](https://github.com/joekain/elixir-life)

#### Dev environments

- https://atlas.hashicorp.com/pgrunwald/boxes/elixir-phoenix-ubuntu-trusty64

### Neovim plugins

- https://github.com/elixir-lang/vim-elixir
- https://github.com/awetzel/elixir.nvim
- https://github.com/jadercorrea/elixir_generator.vim
- https://github.com/avdgaag/vim-phoenix

## License

MIT © [Bram Kok](https://bramkok.com)
