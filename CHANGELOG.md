# Change Log

## [v0.2.5](https://github.com/mburns/statsd/tree/v0.2.5) 2018-04-16

* [Create missing directory for Upstart script](https://github.com/mburns/statsd/pull/11)

## [v0.2.4](https://github.com/mburns/statsd/tree/v0.2.4) (2018-03-02)


### Enhancements

* Test against modern CentOS, Debian & Ubuntu versions
* Lint fix to make CI happy (allow methods longer than 25 lines)
* Update package name to reflect current statsd version

## [v0.2.3](https://github.com/mburns/statsd/tree/v0.2.3) (2018-02-11)

[Full Diff](https://github.com/mburns/statsd/compare/8f8438e87e533601ddce9af42d934e68c7e940f9...b7f8b6a801fd2d011c532a98be097fb5edcb7d31)

### Enhancements

* Add Apache 2.0 License file



## [v0.2.2](https://github.com/mburns/statsd/tree/v0.2.2) (2018-02-11)

[Full Diff](https://github.com/mburns/statsd/compare/1e21e739c934ce752279d7553f5c08dff15faef8...8f8438e87e533601ddce9af42d934e68c7e940f9)

### Compatibility

* Now requires Chef >= 12.10

### Merged Pull Requests

- use dpkg and rpm specific package resources [\#6](https://github.com/mburns/statsd/pull/6) ([mburns](https://github.com/mburns))
- Update yanked version of fpm [\#7](https://github.com/mburns/statsd/pull/7) ([caryp](https://github.com/caryp))


## [v0.2.1](https://github.com/mburns/statsd/tree/1e21e739c934ce752279d7553f5c08dff15faef8) (2015-08-26)

[Full Diff](https://github.com/mburns/statsd/compare/4dc8162c48a9c5f1507b7ed1dfa904ca352f5d74...1e21e739c934ce752279d7553f5c08dff15faef8)

### Merged Pull Requests

- bump to statsd v0.7.2 [\#2](https://github.com/mburns/statsd/pull/2) ([mburns](https://github.com/mburns))



## [v0.2.0](https://github.com/mburns/statsd/tree/v0.2.0) (2015-08-26)

[Full Diff](https://github.com/mburns/statsd/compare/c960a2c1e9ab83794401a5580c2da3027d2c21f9...4dc8162c48a9c5f1507b7ed1dfa904ca352f5d74)

### Merged Pull Requests

- Update Readme [\#5](https://github.com/mburns/statsd/pull/5) ([mburns](https://github.com/mburns))



## [v0.1.0](https://github.com/mburns/statsd/tree/v0.1.0) (2015-08-25)

[Full Diff](https://github.com/mburns/statsd/compare/e4cbaef9d9b86cbe0d92512e2291934d022ad7ef...c960a2c1e9ab83794401a5580c2da3027d2c21f9)

### Enhancements

* Refactor code into separate recipes `statsd::debian`, `statsd::rhel`, and `statsd::service`

### Test Framework

* Set up testing with Test Kitchen and Travis
* Write unit tests
