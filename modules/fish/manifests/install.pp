#A Chassis extension to install and configure Fish Shell on your server.
define fish::install (
	$path = '/usr/bin/fish'
) {

	if ( ! empty( $::config[disabled_extensions] ) and 'chassis/fish' in $::config[disabled_extensions] ) {
		$package = absent
	} else {
		$package = latest
	}

	$content_folder = $::config[mapped_paths][content]

	apt::ppa { 'ppa:fish-shell/release-2': }

	if ( absent == $package ) {
		exec { "chsh -s ${path} ${name}":
			path    => '/bin:/usr/bin',
			unless  => "grep -E '^${name}.+:${$path}$' /etc/passwd",
			require => Package['fish']
		}
	} else {
			exec { 'chsh -s /bin/bash':
			path => '/bin:/usr/bin',
			}
	}

	package { 'fish':
		ensure  => $package,
		require => Apt::Ppa[ 'ppa:fish-shell/release-2' ],
	}

	exec { 'custom fish config':
		path    => '/bin:/usr/bin',
		cwd     => "/home/${name}",
		user    => $name,
		command => "mkdir -p .config/fish && cp ${content_folder}
			/config.fish .config/fish/config.fish",
		unless  => 'ls .config/fish/config.fish',
		onlyif  => "test -s ${content_folder}/config.fish",
	}

}
