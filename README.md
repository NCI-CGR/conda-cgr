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

- [combine_categorical_runs](https://github.com/NCI-CGR/combine_categorical_runs)

- [graf](https://github.com/ncbi/graf)

- [initialize_output_directories](https://github.com/NCI-CGR/initialize_output_directories)

- [qsub_job_monitor](https://github.com/NCI-CGR/qsub_job_monitor)

### How To Contribute!

This process is somewhat complicated, so bear with me. This is really just a draft,
so changes for style or content or bugs should be posted as issues please.

Before any of this: note that this is not exactly how `conda-build` is meant to be
used. `conda-build` has integrated support for updating channels hosted on https://anaconda.org.
You should really consider using that method in the future! But the below is 
for a channel that is hosted separately and individually administered.

#### Make a `conda` environment for building packages

Presumably if you're thinking about package maintenance you already have a `conda` development
environment available to you somewhere? If not, now's a great time. You'll want to initialize
a `conda` environment and add minimally `conda-build` to it. Note that you really ought to
prioritize using `mamba` for package installation, especially for cluster systems that
suffer from slow `conda` dependency resolution operations.

`conda create --name dev`

`conda activate dev`

`conda install mamba`

`mamba install conda-build git`

#### Create a package recipe

If you've not written a `conda` package recipe before, that's beyond the scope of this document.
But there are lots of [tutorials](https://docs.conda.io/projects/conda-build/en/latest/concepts/recipe.html) 
online, and you can also see examples from existing packages
by downloading some of the `conda-cgr/linux-64/*.tar.bz2` files, extracting them, and inspecting
the files `info/meta.yaml` and `info/build.sh`.

When you've created your recipe, put it in its own directory for convenience.

#### Clone or fork and branch `conda-cgr`

You should grab a copy of the CGR conda channel; the clone/branch method is demonstrated below:

`git clone https://github.com/NCI-CGR/conda-cgr`

`cd conda-cgr`

`git checkout -b my_branch`

#### Build the package

Things get complicated here. You want to use `conda-build` to build the package from the recipe
you created. You need `conda` to build it into your branch of the `conda-cgr` channel.

- Navigate into the directory containing your recipe

- Build the package from the recipe:

`conda build --croot=/path/to/conda-cgr/conda-cgr .`

- Inspect your build output. Did it work successfully? If you're building a recipe from scratch
the first time, it almost certainly didn't! You will need to debug and iterate.

- Purge build intermediates. You likely had to try building a few times, and the build intermediate
directories are maintained for logging purposes; but you don't want those at this point.

`conda build --croot=/path/to/conda-cgr/conda-cgr purge`

- Reindex the branch:

`conda index /path/to/conda-cgr/conda-cgr`

- Inspect what has changed in your branch:

`git status`

Be sure that there are only "modified" files along with a single new `*tar.bz2` file that is your
beautiful new package (or more than one, if you did builds for multiple recipes or platforms). Remove
any other unexpected files.

- Add and commit your changes with `git add` and `git commit`

- Push the results back to GitHub: `git push -u origin my_branch`

- Create a Pull Request and merge things with `default`

### Version History

19 January 2021: finally resolved some package recipe/build issues! also seemingly developed
a reasonable method of contributing to the channel

13 January 2021: initial draft published
