class tomcat::install {


file { '/apps/':
    ensure => 'directory',
}->

file { '/apps/installer/':
    ensure => 'directory',
}->


file {'/apps/installer/apache-tomcat-7.0.69.tar.gz':
  source => 'http://mypuppet.master.com:7070/jenkins/job/installers/ws/apache-tomcat-7.0.69.tar.gz',
  mode => '0755',
}->

file {'/apps/installer/jdk-7u79-linux-x64.tar':
  source => 'http://mypuppet.master.com:7070/jenkins/job/installers/ws/jdk-7u79-linux-x64.tar',
  mode => '0755',
}->


exec {'unzip_jdk':
  unless => '/usr/bin/test -d /apps/jdk1.7.0_79',
  cwd => '/apps/',
  command => '/bin/tar -xvf /apps/installer/jdk-7u79-linux-x64.tar',
}->

exec {'unzip_tomcat':
  unless => '/usr/bin/test -d /apps/apache-tomcat-7.0.69',
  cwd => '/apps/',
  command => '/bin/tar -xzvf /apps/installer/apache-tomcat-7.0.69.tar.gz',
}->


file_line {"javahomeset":
   ensure  => present,
   line => 'export JAVA_HOME=/apps/jdk1.7.0_79/',
   path => '/etc/profile',
}->

 file_line {"tomcathomeset":
   ensure  => present,
   line => 'export TOMCAT_HOME=/apps/apache-tomcat-7.0.69/',
   path => '/etc/profile',
}->
 file_line {"pathvarset":
   ensure  => present,
   line => 'export PATH=$JAVA_HOME/bin:$PATH',
   path => '/etc/profile',
}


}
