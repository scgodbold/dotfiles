# Dotfiles by Scott Godbold

Managed by Scott Godbold

## Requirements

These dotfiles are managed via yadm. As such it assumes that yadm has already been installed. Everything else the bootstrap file will attempt to take care of for you.

## Installation
Please follow along below for setup. Not that class must be specified and alternate files re-assessed prior to running the bootstrap scripts.

> Note: bootstrapping can take some time, especially on OSX as some packages are being compiled from source.

```
yadm clone git@github.com:scgodbold/dotfiles.git --no-bootstrap
yadm config local.class <Class>  # Optional
yadm alt  # Run this if class is set
yadm bootstrap
```

### Supported Classes

Currently YADM does not have a switch on the distro type for linux so I have used the class function as a place to specify the distro among other things

| Class | Description |
| ------ | ------ |
| Arch | Specifies the linux distribution as Arch Linux. |
| Ubunut | Sepficies the linux distribution as Ubunut. |
| Work | Specifies as a work computer. |
