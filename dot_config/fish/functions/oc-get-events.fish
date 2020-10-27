function oc-get-events
    oc get events --field-selector involvedObject.name="$argv[1]"
end
