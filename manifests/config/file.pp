define amanda::config::file (
  $resource_description = $name,
  $ensure               = "present",
  $owner                = 0,
  $group                = 0,
  $filemode             = "644",
  $dirmode              = "755"
) {

  $resource_array = split($resource_description, ":")
  $type           = $resource_array[0]
  $agent_path     = $resource_array[1]
  $master_path    = $resource_array[2]

  file { "${agent_path}":
    owner  => $owner,
    group  => $group,
    source => "puppet://${server}/modules/amanda/${master_path}",
    mode   => $type ? {
      "file"      => $filemode,
      "directory" => $dirmode,
    },
    ensure => $ensure ? {
      "present" => $type,
      "absent"  => absent,
    },  
  }
}
