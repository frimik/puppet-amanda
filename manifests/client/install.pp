class amanda::client::install {
	
  package { "amanda-backup-client":
		ensure   => installed,
		provider => dpkg,
		source   => "${debrepository}/amanda-backup-client_3.3.0-1Ubuntu1004_amd64.deb",
		require  => [ Class[Amanda::Client::Prereqs], User["amandabackup"] ],
	}
	
	user { "amandabackup":
		ensure   => present,
		comment  => "Amanda user",
		gid      => "disk",
		shell		 => "/bin/bash",
		require  => Group["disk"],
	}
	
	group { "disk":
		ensure   => present,
 
	
}