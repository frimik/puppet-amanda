class amanda::server::install {
	
  package { "amanda-backup-server":
		ensure   => installed,
		require  => [ Class[Amanda::Server::Prereqs], User["amandabackup"] ],
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