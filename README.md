BruteBlocker
========

Blocks bruteforces

Installing
----------
* Make a logpipe with mkfifo logpipe
* Set up rsyslog.d or rsyslog.conf with this rule: auth.* |/path/to/logpipe
* Set /path/to/logpipe in the script too (default: /opt/BruteBlocker/logpipe)
* Make an IPtables chain called BLOCKS and make a rule to police incoming connections from internet. Something like
  * iptables -N BLOCKS
  * iptables -A INPUT -i eth0 ! -s 192.168.1.0/24 -j BLOCKS
* Run blocker.php in a screen
