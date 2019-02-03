# stackstorm-chatops-playground
Test repository to create working example of HA chatops instance
```

export ST2CLIENT=$(kubectl get --namespace stackstorm pod -l app=st2client,release=stackstorm -o jsonpath="{.items[0].metadata.name}")
kubectl exec -it ${ST2CLIENT} -- st2 apikey create -k -m '{"used_by": "ChatOps"}'

st2 apikey create -k -m '{"used_by": "ChatOps"}'
docker build -t vkfont/debug:st-chatops --build-arg ST2_VERSION="3.0dev" .
docker push vkfont/debug:st-chatops

docker run \
-e HUBOT_ADAPTER="telegram-better" \
-e HUBOT_NAME="MakeOBot" \
-e TELEGRAM_TOKEN="..." \
-e ST2_API="http://stackstorm-st2api.stackstorm.svc.cluster.local:9101/" \
-e ST2_AUTH_URL="http://stackstorm-st2auth.stackstorm.svc.cluster.local:9101/" \
-e ST2_STREAM_URL="http://stackstorm-st2stream.stackstorm.svc.cluster.local:9101/" \
-e ST2_API_KEY="NmYwMzA0OGYyMjM2NDQwMDZjMjNlZjQ5OWJhYzJlMTE2ZWY2OTkwOGZjYWU4YTMyMzk3OTM5MjY2ZTFiODIxNA" \
vkfont/debug
```

### TODO
- e