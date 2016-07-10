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
    - [Install `erlang` and `elixir`](#install-erlang-and-elixir)
  - [4. Install Neovim and plugins](#4-install-neovim-and-plugins)
    - [Install `nvim` and `client-neovim`](#install-nvim-and-client-neovim)
- [Arch Linux](#arch-linux)
  - [Original base box](#original-base-box)
  - [Modified base box](#modified-base-box)
- [Vim and Neovim](#vim-and-neovim)
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

#### Update and install `yaourt`, `git`, `xsel` and `fish`


```bash
$ sudo pacman -Sy --noconfirm yaourt git xsel fish
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
$ fisher mono z edc/bass pyenv
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

### Original base box

The Arch Linux x86_64 Vagrant base box `bugyt/archlinux` has been used as the
starting point for this environment.

* GitHub [`bugyt/archlinux`](https://github.com/bugyt/archlinux)
* Atlas [`bugyt/archlinux`](https://vagrantcloud.com/bugyt/boxes/archlinux)

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

## Vim and Neovim

## License

MIT © [Bram Kok](https://bramkok.com)
