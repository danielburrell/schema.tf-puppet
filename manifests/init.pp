# == Class: schematf
#
# Full description of class schematf here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'schematf':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class schematf (
  $service_ensure     = $schematf::params::service_ensure,
  $service_manage     = $schematf::params::service_manage,
  $service_name       = $schematf::params::service_name,
  $package_ensure     = $schematf::params::package_ensure,
  $package_name       = $schematf::params::package_name,
  $package_provider   = $schematf::params::package_provider,
  $version            = $schematf::params::version,
  $repo_key,
  #mongo db to connect to
  $steam_apikey,
  $twitter_consumer_key,
  $twitter_consumer_secret,
  $twitter_access_token,
  $twitter_access_token_secret,
  $dropbox_token,

  #port the web service should listen on
  $server_port,
  #encyrption key and initialization vector for cookies
  #$encryption_key,
  #$encryption_iv,
  #github key for oauth
  $domain             = $schematf::params::domain,
  $repos_ensure               = $schematf::params::repos_ensure,
  #should the service be managed
) inherits schematf::params {


  case $::osfamily {

    'Debian': {
      class { '::schematf::repo::apt' :
       repo_key  => $repo_key
      }
      $package_require = Class['apt::update']
    }
    default: {
      $package_require = undef
    }
  }

	  include schematf::install
    include schematf::config
    include schematf::service

}
