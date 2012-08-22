puppet-vemap
============

Install Varnish, Nginx, MySQL, APC and PHP on Debian

# add vhost

```
vhost { 'mysite.com':
  name   => 'mysite.com',
  ensure => 'present'
}
```

# remove vhost

```
vhost { 'default':
  ensure => 'absent'
}
```
