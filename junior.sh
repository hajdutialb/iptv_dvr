#!/bin/bash

curl -x 46.99.178.155:1339 -c cookies.txt -H 'Host: nimi.norago.tv' -H 'accept: */*' -H 'content-type: application/json' -H 'charset: UTF-8' -H 'user-agent: NimiTV/3.0 (com.ftamarket.nimitv; build:1000; iOS 15.0.0) Alamofire/5.6.1' -H 'accept-language: en-US;q=1.0, it-US;q=0.9, ar-US;q=0.8, zh-Hant-US;q=0.7, fr-US;q=0.6' --data-binary "$NIMI_AUTH" --compressed 'https://nimi.norago.tv/wbs/android/auth' > /dev/null 2>&1

resp=$(curl -x 46.99.178.155:1339 -b cookies.txt -H 'Host: nimi.norago.tv' -H 'accept: */*' -H 'content-type: application/json' -H 'charset: UTF-8' -H 'user-agent: NimiTV/3.0 (com.ftamarket.nimitv; build:1000; iOS 15.0.0) Alamofire/5.6.1' -H 'accept-language: en-US;q=1.0, it-US;q=0.9, ar-US;q=0.8, zh-Hant-US;q=0.7, fr-US;q=0.6' --compressed 'https://nimi.norago.tv/wbs/api/v3/channels/tv/20002406/url' 2> /dev/null)
URL=$(echo "$resp" | jq -r .payload.playbackUrl)

if [[ ! $resp == *"http"* ]]; then
    echo "Failed to get link: $resp"
    exit 1
fi

echo "$URL"
exit 0

