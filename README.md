[![Build Status](https://travis-ci.org/mburns/statsd.svg?branch=master)](https://travis-ci.org/mburns/statsd)
[![Cookbook Version](https://img.shields.io/cookbook/v/statsd.svg)](https://supermarket.chef.io/cookbooks/statsd)

# Description

Installs and configures [Statsd](http://github.com/etsy/statsd)

# Platforms

* Ubuntu 14.04, 16.04
* RHEL 6.9, 7.3
* Debian 8.9
# Attributes

Attribute | Type | Default | Description
--------- | ---- | --------| -----------
`node['statsd']['port']` | Integer | `8125` | Port for Statsd to listen for stats on
`node['statsd']['graphite_host']` | String | `'localhost'` | Host to forward processed statistics to
`node['statsd']['graphite_port']` | Integer | `2003` | Port to forward processed statistics to
`node['statsd']['graphite_options']` | Hash | `{}` | Additional [graphite namespacing options](https://github.com/etsy/statsd/blob/master/docs/namespacing.md)
`node['statsd']['package_version']` | String | `'0.6.0'` | Version to use when creating the package
`node['statsd']['tmp_dir']` | String | `'/tmp'` | Temporary directory to use while building the package
`node['statsd']['repo']` | String | `'https://github.com/etsy/statsd.git'` | git repository to use
`node['statsd']['sha']` | Integer | `d16d744e6424dfd519dc71795a212ad1c08c3114` | SHA commit id of the repo to use

# Usage

Include the statsd recipe which will checkout Statsd from git, build a package from it, and then install the package. Statsd is run under a "statsd" system user.

By default statsd will attempt to send statistics to a graphite instance running on localhost, which can be configured using the Graphite cookbook at http://community.opscode.com/cookbooks/graphite.
