$chassis_config = sz_load_config()

class { 'fish':
  path   => '/vagrant/extensions/fish',
  config => $chassis_config
}
