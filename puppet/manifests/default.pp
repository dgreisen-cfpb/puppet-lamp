# puppet manifest run by vagrant on boot

import 'apache_setup'
import 'mysql_setup'

include apache_setup
include mysql_setup