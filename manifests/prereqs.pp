class amanda::prereqs {
	package { ["xinetd", "mailutils", "libcurl3", "libreadline5" ]:
		ensure => present,
	}
}