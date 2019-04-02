class nginx {
	package { 'nginx':
		ensure => installed,
      
      }

      file { '/etc/nginx':
      	ensure => 'directory',
	recurse => true,
	owner => 'root',
	group => 'root',
	mode => '0755',

	}

      file { 'conf.d':
       path    => '/etc/nginx/conf.d/',
       ensure  => directory,
       recurse => true,
       mode    => '0755',
       owner   => 'root',
       group   => 'root',
       source  => "puppet:///modules/nginx/conf.d",
   }

      file { '/etc/nginx/nginx.conf':
	notify => Service['nginx'],
	ensure => file,
	mode   => '0644',
	owner => 'root',
	group => 'root',
	source => "puppet:///modules/nginx/nginx.conf",

	}

      service { 'nginx':
   	ensure => 'running',
	enable => true,
	require => File["/etc/nginx/nginx.conf"],

	}

