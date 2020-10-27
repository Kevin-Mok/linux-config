function redeploy-operator
    oc delete deployment kogito-operator
    make deploy-operator-on-ocp
    oc get pods -w
end
