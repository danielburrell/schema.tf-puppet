class schematf::config (
  $user     = $schematf::params::user,
  $group    = $schematf::params::group,
)
inherits schematf {

  file { '/opt/solong/schematf/current/conf/prod.properties':
    ensure  => file,
    owner   => $user,
    group   => $group,
    mode    => '400',
    content => template("${module_name}/prod.properties.erb"),
    require => Package['schematf']
  }

}