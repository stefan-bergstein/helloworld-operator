
case "$1" in

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


