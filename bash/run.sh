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
ifconfig > $outdir/ifconfig.log

echo ip
ip -6 addr > $outdir/ip.log

echo Who
w    > $outdir/w.log
who  > $outdir/who.log
last > $outdir/last.log

echo Pings
out=$outdir/pings/
mkdir -p $out
bash pings.sh $out

echo Fierwall
ufw status verbose > $outdir/ufw_status.log

echo Git
git add ../*
git commit -m 'asd'
git push
chown -R user:user .
