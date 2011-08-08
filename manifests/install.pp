class amanda::install {
	
  package { "amanda-server":
		ensure   => installed,
		provider => dpkg,
		source   => "${debrepository}/amanda-backup-server_3.3.0.git.c6800947-1Ubuntu1004_amd64.deb",
		require  => [ Class[Amanda::Prereqs], User["backup"] ],
	}
	
	user { "backup":
		ensure   => present,
		comment  => "Amanda user",
		gid      => "backup",
		shell		 => "/bin/bash",
		require  => Group["amanda"],
	}
	
	group { "backup":
		ensure   => present,
	}
	
}