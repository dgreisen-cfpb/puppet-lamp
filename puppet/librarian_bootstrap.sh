#!/bin/bash

yum install -y git
gem install librarian-puppet -v 1.0.3

cd /etc/puppet
librarian-puppet install