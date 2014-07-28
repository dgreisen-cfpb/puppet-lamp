# puppet manifest run by vagrant on boot

import 'php_setup'
import 'apache_setup'
import 'mysql_setup'

include php_setup
include apache_setup
include mysql_setup
