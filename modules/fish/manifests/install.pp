define fish::install( $path = '/usr/bin/fish' ) {

  $content_folder = $config[mapped_paths][content]

  apt::ppa { "ppa:fish-shell/release-2": }

  exec { "chsh -s $path $name":
    path    => '/bin:/usr/bin',
    unless  => "grep -E '^${name}.+:${$path}$' /etc/passwd",
    require => Package['fish']
  }

  package { 'fish':
    ensure  => latest,
    require => Apt::Ppa[ 'ppa:fish-shell/release-2' ],
  }

  exec { 'custom fish config':
    path    => '/bin:/usr/bin',
    cwd     => "/home/$name",
    user    => $name,
    command => "mkdir -p .config/fish && cp ${content_folder}/config.fish .config/fish/config.fish",
    unless  => 'ls .config/fish/config.fish',
    onlyif  => "test -s ${content_folder}/config.fish",
  }

}
