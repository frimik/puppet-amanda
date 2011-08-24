class amanda::client::prereqs {
	package { ["xinetd"] :
		ensure => present,
	}
}