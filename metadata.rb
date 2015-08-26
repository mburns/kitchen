name 'statsd'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache 2.0'
description 'Installs/Configures statsd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'build-essential'
depends 'git'
depends 'nodejs'

supports 'debian'
supports 'ubuntu', '>= 12.04'
supports 'redhat'

recipe 'statsd::default', 'Writes configuration file'
recipe 'statsd::debian', 'Builds and installs dpkg (ubuntu, debian)'
recipe 'statsd::rhel', 'Builds and installs rpm (Redhat, Centos, Fedora)'
recipe 'statsd::service', 'Configures init and service'
