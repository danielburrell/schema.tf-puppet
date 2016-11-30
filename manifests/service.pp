class schematf::service(
  $service_ensure = $schematf::service_ensure,
  $service_manage = $schematf::service_manage,
  $service_name   = $schematf::service_name,
) inherits schematf {

  require jdk_oracle
  
  validate_re($service_ensure, '^(running|stopped)$')
  validate_bool($service_manage)

  if ($service_manage) {
    if $service_ensure == 'running' {
      $ensure_real = 'running'
      $enable_real = true
    } else {
      $ensure_real = 'stopped'
      $enable_real = false
    }

    service { 'schematf':
      ensure     => $ensure_real,
      enable     => $enable_real,
      hasstatus  => true,
      hasrestart => true,
      name       => $service_name,
	    require    => Package['schematf']
    }
  }

}