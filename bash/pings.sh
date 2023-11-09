ip=8.8.8.8
out=$1
ping $ip -c 10 > $out/$ip.log

ip=point.md
ping $ip -c 10 > $out/$ip.log

ip=nytimes.com
ping $ip -c 10 > $out/$ip.log