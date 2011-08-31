class amanda::client::install {
	
  package { "amanda-backup-client":
		ensure   => installed,
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