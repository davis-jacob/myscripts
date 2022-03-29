#!/bin/bash
#set -x

curl -o /tmp/ecp-base-images.txt https://raw.githubusercontent.com/hpe-hcss/caas-registry-mirror/main/metadata/5.3.7.8394/ecp-base-images.txt?token=GHSAT0AAAAAABSQRNAMSMX7725CSZOCIXKIYRZ5ITQ
if [[ $? -ne 0 ]]; then
   echo "ERROR: Failed to download ECP BASE images file"
   exit 1
fi
BASE_IMAGES=$(cat /tmp/ecp-base-images.txt |awk '{print $1}')
for i in ${BASE_IMAGES}; do
    NEW_TAG="test-pranav2.glpcaas-hpe.net/$i"

    echo "============== $i"
    docker pull $i
    docker tag $i ${NEW_TAG}
    docker push ${NEW_TAG}
done

curl -o /tmp/ecp-delta-images.txt https://raw.githubusercontent.com/hpe-hcss/caas-registry-mirror/main/metadata/5.3.7.8394/ecp-delta-images.txt?token=GHSAT0AAAAAABSQRNAMSZFWQXQJS2FNJJMCYRZ5J7Q
if [[ $? -ne 0 ]]; then
   echo "ERROR: Failed to download ECP DELTA images file"
   exit 1
fi
DELTA_IMAGES=$(cat /tmp/ecp-delta-images.txt |awk '{print $1}')
for i in ${DELTA_IMAGES}; do
    NEW_TAG1="test-pranav2.glpcaas-hpe.net/$i"

    echo "============== $i"
    docker pull $i
    docker tag $i ${NEW_TAG1}
    docker push ${NEW_TAG1}
done

curl -o /tmp/ecp-app-images.txt https://raw.githubusercontent.com/hpe-hcss/caas-registry-mirror/main/metadata/5.3.7.8394/gl-app-images.txt?token=GHSAT0AAAAAABSQRNANM573DI5K5UALKDDWYRZ5KSQ
if [[ $? -ne 0 ]]; then
   echo "ERROR: Failed to download ECP APP IMAGES images file"
   exit 1
fi
APP_IMAGES=$(cat /tmp/ecp-app-images.txt |awk '{print $1}')
for i in ${APP_IMAGES}; do
    NEW_TAG2="test-pranav2.glpcaas-hpe.net/$i"

    echo "============== $i"
    docker pull $i
    docker tag $i ${NEW_TAG2}
    docker push ${NEW_TAG2}
done

echo 0
