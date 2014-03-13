package { 'subversion':
	ensure  => present,
}
package { 'cmatrix':
	ensure  => present,
}

file { '/root/.bashrc':
	ensure  => present,
	content => 'export PATH="${PATH}:/usr/games"',
}
file { '/root/demo':
	ensure  => link,
	target  => '/vagrant/demo',
}

exec { 'apt-get-update-stale-cache':
	path 	=> '/bin:/usr/bin',
	command => 'apt-get update',
	onlyif  => 'find /var/lib/apt/lists -maxdepth 0 -mtime +7 | grep "/var/lib/apt/lists"'
}
Exec['apt-get-update-very-old-cache'] -> Package <| |>