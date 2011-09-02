class amanda::server (
  $configs  = [],
  $confdir  = "/etc/amanda",
  $owner    = "amanda",
  $group    = "amanda",
  $filemode = "644",
  $dirmode  = "755"
) {
  include amanda

  file {
    $confdir:
      ensure => directory,
      owner  => $owner,
      group  => $group,
      mode   => $dirmode;
  }

  amanda::config {
    $configs:
      ensure    => present,
      confdir   => $confdir,
      owner     => $owner,
      group     => $group,
      filemode  => $filemode,
      dirmode   => $dirmode;
  }
}
