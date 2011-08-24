class amanda::install {
	
  package { "amanda-server":
		ensure   => installed,
		provider => dpkg,
		source   => "${debrepository}/amanda-backup-server_3.3.0-1Ubuntu1004_amd64.deb",
		require  => [ Class[Amanda::Prereqs], User["amandabackup"] ],
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
	
	file { "/var/log/amanda/server":
		ensure	 => directory,
		owner		 => amandabackup,
		group    => disk,
		mode		 => 640,
	}
	
}