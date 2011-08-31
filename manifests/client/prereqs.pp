class amanda::client::prereqs {
	package { ["xinetd", "tar" ] :
		ensure => present,
	}
}