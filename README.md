cartodb Omnibus project
========================
This omnibus project has both a full-stack platform-specific package named `cartodb` **AND** individual services packages.

Installation
------------
You must have a sane Ruby 1.9+ environment with Bundler installed. Ensure all
the required gems are installed:

```shell
# gem install bundle
bundle install --binstubs
```

Usage
-----
### Build

You create a platform-specific package using the `build project` command:

```shell
bin/omnibus build cartodb
```

The platform/architecture type of the package created will match the platform
where the `build project` command is invoked. For example, running this command
on a MacBook Pro will generate a Mac OS X package. After the build completes
packages will be available in the `pkg/` folder under `base_dir`.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
bin/omnibus clean cartodb
```

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/cartodb`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
bin/omnibus clean cartodb --purge
```

### Help

Full help for the Omnibus command line interface can be accessed with the
`help` command:

```shell
$ bin/omnibus help
```
