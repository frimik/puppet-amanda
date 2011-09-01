define amanda::config (
  $config   = $name,
  $confdir  = "/etc/amanda/${name}",
  $ensure   = "present",
  $owner    = 0,
  $group    = 0,
  $filemode = "644",
  $dirmode  = "755"
) {

  $files = amanda_config_files("rolling", $confdir)

  file {
    "$confdir/$config":
      ensure => directory,
      owner  => $owner,
      group  => $group,
      mode   => $dirmode,
  }

  amanda::config::file {
    $files:
      ensure   => $ensure,
      owner    => $owner,
      group    => $group,
      filemode => $filemode,
      dirmode  => $dirmode,
      require  => File["$confdir/$config"],
  }
}
