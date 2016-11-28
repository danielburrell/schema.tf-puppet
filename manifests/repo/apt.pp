class schematf::repo::apt(
  $location     = "https://${repo_key}@apt.fury.io/danielburrell/",
  $release      = ' ',
  $repos        = '/',
  $include_src  = false,
  #$key          = 'KEY HERE',
  #$key_source   = 'https://www.mit...signing-key.asc',
  $architecture = undef,
  $repo_key,
  $allow_unsigned = $schematf::params::allow_unsigned
  ) {

  # ordering / ensure to get the last version of repository
  Class['schematf::repo::apt']
  -> Class['apt::update']
  -> Package<| title == 'schematf' |>

  $ensure_source = $schematf::repos_ensure ? {
    false   => 'absent',
    default => 'present',
  }

	apt::source { 'fury':
    ensure       => $ensure_source,
    location     => $location,
    release      => $release,
    repos        => $repos,
    include_src  => $include_src,
    #key      => {
    #  'id'     => $key,
    #  'server' => $key_source,
    #}
    architecture => $architecture,
	  allow_unsigned => $allow_unsigned,
	}

}
