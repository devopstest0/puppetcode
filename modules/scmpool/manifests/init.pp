# Class: scmpool
# ===========================
#
# Full description of class scmpool here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'scmpool':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class scmpool {


 file{'/usr/local/bin/clonegit.sh':
  ensure => present,
  source => 'puppet:///modules/scmpool/clonegit.sh',
  owner => 'root',
  group => 'root',
  mode => '0755',
 }
 cron{'clonegit.sh':
  command => '/usr/local/bin/clonegit.sh',
  user => 'root',
  minute => [0,20,40],
  require => File['/usr/local/bin/clonegit.sh'],
  ensure => present,
 }
 file{'/root/.ssh':
  ensure => directory,
  owner => 'root',
  group => 'root',
  mode => '0700',
 }
 file{'/root/.ssh/config':
  ensure => present,
  source => 'puppet:///modules/scmpool/rootsshconfig',
  owner => 'root',
  group => 'root',
  mode => '0600',
  require => File['/root/.ssh'],
 }
 file{'/root/.ssh/id_rsa_github':
  ensure => present,
  source => 'puppet:///modules/scmpool/id_rsa_repo',
  owner => 'root',
  group => 'root',
  mode => '0600',
  require => File['/root/.ssh'],
 }
 file{'/root/.ssh/id_rsa_github.pub':
  ensure => present,
  source => 'puppet:///modules/scmpool/id_rsa_repo.pub',
  owner => 'root',
  group => 'root',
  mode => '0644',
  require => File['/root/.ssh/id_rsa_github'],
 }

}
