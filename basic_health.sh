while :
  do
    if [ -f /health.sh ]; then
      sh /health.sh && break
    else
      netstat -ln | grep -q {{ $port }} && /opt/containerpilot/tools/curl --output /dev/null --fail --silent --insecure http://127.0.0.1:80 && echo "ok" && break
      echo "Service not responding to basic health check: http://127.0.0.1:80. Trying again in 5s..."
    fi
    sleep 5
done
