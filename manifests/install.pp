class schematf::install(
	$version = 	$schematf::params::version,
	$package_name = 		$schematf::params::package_name,
	$user   = $schematf::params::user,
	$group   = $schematf::params::group
) inherits schematf {

	group { 'schematfgroup':
		name   => $group,
		ensure => present,
	}

	user { 'schematfuser':
		name           => $user,
		groups         => [$group],
		password       => '*',
	}


	class { 'jdk_oracle': }

  package { 'schematf':
	  name     => $package_name,
	  ensure   => $version,
	  require  => Apt::Source['fury'],
  }

}