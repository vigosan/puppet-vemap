node 'app' {
  include 'nginx'
  include 'php_fpm'
  include 'mysql'
}
