define fish::install( $path = '/usr/bin/fish' ) {

  apt::ppa { "ppa:fish-shell/release-2": }

  exec { "chsh -s $path $name":
    path    => '/bin:/usr/bin',
    unless  => "grep -E '^${name}.+:${$path}$' /etc/passwd",
    require => Package['fish']
  }

  package { 'fish':
    ensure  => latest,
    require => Apt::Ppa[ "ppa:fish-shell/release-2" ],
  }

}
