file { '/home/moxio/banner.txt':
	ensure => present,
	source => '/root/demo/files/banner.txt',
	owner  => moxio,
	group  => www-data,
	mode   => '0664'
}