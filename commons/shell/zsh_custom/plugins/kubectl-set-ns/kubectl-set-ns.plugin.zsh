kns() {
    kubectl config set-context --current --namespace "$1"
}

_kns() {
    local namespaces
    namespaces=($(kubectl get namespaces -o jsonpath='{.items[*].metadata.name}' 2>/dev/null))

    _describe 'values' namespaces
}

compdef _kns kns
