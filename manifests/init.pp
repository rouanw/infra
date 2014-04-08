file { some_file:
	ensure => present,
	path => "/home/vagrant/somefile.txt",
	content => 'hello',
}

file { ruby_script:
	ensure => present,
	path => "/home/vagrant/hello.rb",
	source => '/vagrant/hello.rb',
}

exec { say_hello:
	command => 'ruby hello.rb',
	require => [File['some_file'], File['ruby_script']],
	path => '/usr/bin',
}

package { postgresql:
	ensure => installed,
}

service { postgresql:
	ensure => running,
	require => Package['postgresql'],
}
