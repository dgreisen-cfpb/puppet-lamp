# Puppet LAMP

This repository allows you to quickly start creating a new
system using vagrant, puppet, centos, and a standard LAMP stack.

This repo is based off [puppet-skeleton](https://github.com/dgreisen-cfpb/puppet-skeleton). The recommended way to get started is to [duplifork](https://github.com/enyojs/enyo/wiki/Dupliforking) this repository then make your changes. Then, as this repository is improved you can simply pull updates into your project.

How to use:

1. [duplifork](https://github.com/enyojs/enyo/wiki/Dupliforking) this repo
1. Add any puppet modules to `puppet/Puppetfile` according to the [librarian-puppet instructions](https://github.com/rodjek/librarian-puppet)
1. Edit `puppet/hiera.yaml` to instantiate variables for use in your puppet scripts
1. Edit `puppet/manifests/default.pp` to provide additional puppet automation
1. Edit `puppet/hiera.yaml` to modify any variables (see http://docs.puppetlabs.com/hiera/1/)

How it works:

* All puppet-related files are in the `puppet` subdirectory.
* We use [librarian-puppet](https://github.com/rodjek/librarian-puppet) to define modules in the `puppet/Puppetfile` and then load them onto the host.
* We create a shared folder to store the modules so they don't have to be downloaded every time.
* We modify the Vagrantfile to (1) install and run librarian-puppet (2) run puppet with appropriate paths to various files.
* We install apache, mysql and php.

Thanks to Dan Davis for his help and guidance
