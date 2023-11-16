git pull --tags -r origin main

outdir=../logs/"$(date +"%Y")"/"$(date +"%d")"
mkdir -p $outdir/routes


timeout 5m bash ./routes.sh point.md $outdir/routes
timeout 5m bash ./routes.sh 8.8.8.8 $outdir/routes
timeout 5m bash ./routes.sh nytimes.com $outdir/routes

echo ip
out=$outdir/myip.log
bash ./myip.sh  $out

echo ifconfig
/sbin/ifconfig > $outdir/ifconfig.log 2>&1

echo ip
ip -6 addr > $outdir/ip.log 2>&1

echo Who
w    > $outdir/w.log
who  > $outdir/who.log
last > $outdir/last.log

echo Pings
out=$outdir/pings/
mkdir -p $out
bash pings.sh $out

echo Fierwall
/usr/sbin/ufw status verbose > $outdir/ufw_status.log 2>&1

echo iptables
/sbin/iptables -L > $outdir/iptables.log 2>&1

echo Git
git add ../*
git commit -m 'updates'
git push
chown -R user:user .
