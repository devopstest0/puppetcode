
class tomcat::deploy {

$jenkins_build_path = 'http://mypuppet.master.com:7070/jenkins/job/BUILD/lastSuccessfulBuild/artifact/target/helloproject.war'


file {'/apps/apache-tomcat-7.0.69/webapps/helloproject.war':
  source => "$jenkins_build_path",
  mode => '0755',
  notify => Exec['restart_tomcat'],
}

exec {'restart_tomcat':
  cwd => '/apps/',
  command => "/bin/sh -c 'cd /apps/apache-tomcat-7.0.69/bin/ && ./shutdown.sh && sleep 10 && ./startup.sh '",
  refreshonly => true,
  subscribe => File['/apps/apache-tomcat-7.0.69/webapps/helloproject.war'],
}


}
