# helloworld-operator

This is a simple, Ansible based operator with two dummy APIs. It does not do anything useful, except showing a working skeleton. The repo contains a bundle and Operator Lifecycle Manager (OLM) catalog container so that the operator can be managed with the OLM.

## CRDs / APIs
- Hello World
- Hey You

## Sources
Following sources guided the basic exercise of building this operator just for learning purposes.

- [Kubernetes operators book](https://www.redhat.com/en/resources/oreilly-kubernetes-operators-automation-ebook)
- [Creating Ansible-based Operators](https://docs.openshift.com/container-platform/4.4/operators/operator_sdk/osdk-ansible.html)
- [OpenShift Operator Lifecycle Management Guide: Integrating Operators in OLM Part IV](https://keithtenzer.com/2020/04/23/openshift-operator-lifecycle-management-guide-integrating-operators-in-olm-part-iv/)

- [Infrastructure Operator] (https://github.com/sa-mw-dach/manuela/blob/master/docs/module-infrastructure-operator-development.md#infrastructure-operator-)

## Deploy the Operator

``` 
oc create -f deploy/catalogsource.yaml -n openshift-marketplace

```