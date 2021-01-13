## conda-cgr

A CGR-specific conda channel that can be happily cluttered with
random internal software packages and needs.

### Overview

Inspired by some non-canonical `conda` channels, but really even moreso
`portage` overlays in Gentoo Linux, I've drafted a `conda` channel in this
repository.

### Usage

##### New to conda?

If you've not used `conda` before, welcome! It's really great, and a natural
step once you've found that `module load` on your friendly local cluster is
wildly insufficient for your needs. There are plenty of guides online to 
installing `conda`; [this guide](https://bioconda.github.io/user/install.html)
is a decent place to start.

#### Selecting the Channel

##### Adding the channel to your `.condarc`

You should already have a configuration file `.condarc` in your home directory.
You can add a channel to it directly using a text editor, or use the following command:

`conda config --add channels https://raw.githubusercontent.com/NCI-CGR/conda-cgr/default/conda-cgr`

### Supported Packages

- `graf`

- `initialize_output_directories`

### How To Contribute!

I'm not entirely certain! I'm working on it.

### Version History

13 January 2021: initial draft published
