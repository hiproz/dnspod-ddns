TOOL_ROOT=/data/dnspod-shell-tcapi
export PATH=$PATH:$TOOL_ROOT
chmod +x $TOOL_ROOT/openssl
chmod +x $TOOL_ROOT/curl

while true
do
    dnspod.sh
    sleep 60
done
