# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include myupdater
class myupdater {
  $timestamp = generate('/usr/bin/date', '+%Y-%m-%dT%H:%M:%S')
  exec{'yum_updater':
    path    => '/usr/bin',
    command => 'yum update -y; yum upgrade',
    onlyif  => '/bin/test ! -f /home/vagrant/yum_updated'
  }
  ~> file{'/home/vagrant/yum_updated':
    ensure  => present,
    owner   => 'vagrant',
    group   => 'vagrant',
    mode    => '0644',
    #content => $timestamp
    content => ''
  }
}
