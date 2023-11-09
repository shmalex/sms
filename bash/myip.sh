out=$1
echo "ipinfo" > $out
curl https://ipinfo.io/ip >> $out
echo "" >> $out

echo "ipecho" >> $out
curl https://ipecho.net/plain >> $out
echo "" >> $out

echo "ipify" >> $out
curl api.ipify.org >> $out
echo "" >> $out

echo "ident" >> $out
curl ident.me >> $out
