# A Chassis extension to install and configure Fish Shell on your server.
class fish (
	$config,
	$path = '/vagrant/extensions/fish'
) {
	fish::install { 'vagrant':
	}
}
