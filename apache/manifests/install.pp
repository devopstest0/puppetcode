

# Install Apache Server

class apache::install {


package { 'apache2': 
	ensure => present,
}->	

package { 'libapache2-mod-jk':
	ensure => present,
}


}
