
# Repo Manifest file 

case $::family {
  'Debian': {
    include 'base'
  }

  'windows': {}

  'Redhat': {}
}
