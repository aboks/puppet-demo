user { 'moxio':
	ensure     => present,
	home       => '/home/moxio',
	managehome => true,
	password   => sha1('moxio'),
	groups     => ['sudo', 'audio'],
}