class schematf::params {
  case $::osfamily {
    'Debian': {
      $package_ensure   = 'installed'
      $package_name     = 'schematf'
      $service_name     = 'schematf'
      $package_provider = 'apt'
      $version          = 'latest'
      $user    = 'schematf'
      $group   = 'schematf'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

  #install

  $repos_ensure = true
  $repo_key = undef
  #mongo db to connect to
  $mongo_collection = 'schematf'
  $mongo_db = 'schematf'
  $mongo_host = undef
  $mongo_port = undef
  #port the web service should listen on
  $server_port = undef
  #encyrption key and initialization vector for cookies
  $encryption_key = undef
  $encryption_iv = undef
  #github key for oauth
  $github_clientsecret = undef
  $github_clientid = undef
  $domain = '.schematf.tf'
  #should the service be managed
  $service_manage = true
  $service_ensure = 'running'
  $allow_unsigned = true
}