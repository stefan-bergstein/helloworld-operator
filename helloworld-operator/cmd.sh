
case "$1" in

secret)

oc create secret generic helloworld-operator-azure-conf --from-literal=AZURE_TENANT=$AZURE_TENANT --from-literal=AZURE_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID --from-literal=AZURE_CLIENT_ID=$AZURE_CLIENT_ID --from-literal=AZURE_SECRET=$AZURE_SECRET

;;


build)

operator-sdk build quay.io/sbergste/helloword-operator:v0.0.1
docker push quay.io/sbergste/helloword-operator:v0.0.1
oc create -f deploy/service_account.yaml
oc create -f deploy/role.yaml
oc create -f deploy/role_binding.yaml
oc create -f deploy/operator.yaml


;;


bundle)

ver=v0.0.6
operator-sdk bundle create quay.io/sbergste/helloworld-operator-catalog --channels alpha --package helloworld-operator-catalog --directory deploy/olm-catalog/helloworld-operator/manifests/
docker tag quay.io/sbergste/helloworld-operator-catalog:latest quay.io/sbergste/helloworld-operator-catalog:${ver}
docker push quay.io/sbergste/helloworld-operator-catalog:${ver}
opm index add -c docker --bundles quay.io/sbergste/helloworld-operator-catalog:${ver} --tag quay.io/sbergste/helloworld-operator-index:${ver}
docker push quay.io/sbergste/helloworld-operator-index:${ver}
;;

*)
            echo $"Usage: $0 {bundle}"
            exit 1
esac


