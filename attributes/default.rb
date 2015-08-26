default['statsd']['port'] = 8125
default['statsd']['graphite_port'] = 2003
default['statsd']['graphite_host'] = 'localhost'
default['statsd']['package_version'] = '0.6.0'
default['statsd']['sha'] = '972993ef59c34ab92883bc62271efbc90514dde3'
default['statsd']['user'] = 'statsd'
default['statsd']['repo'] = 'https://github.com/etsy/statsd.git'
default['statsd']['tmp_dir'] = '/tmp'

# graphite_options come from https://github.com/etsy/statsd/blob/master/docs/namespacing.md
# example:
#   default['statsd']['graphite_options'] = {
#     'legacyNamespace' => false
#   }

default['statsd']['graphite_options'] = {}
