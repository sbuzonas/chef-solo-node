name             'chef-solo-node'
maintainer       'FancyGuy Technologies'
maintainer_email 'devops@fancyguy.com'
license          'Apache 2.0'
description      'Installs/Configures chef-solo-node'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

recipe 'chef-solo-node', 'Captures necessary information from the generated node to persist in a data bag to be searched with chef-solo-search'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'
