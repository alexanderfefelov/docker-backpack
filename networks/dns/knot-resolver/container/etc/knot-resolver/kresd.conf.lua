modules = {
  'hints > iterate',
  'http'
}

net.listen('0.0.0.0', 53, {kind = 'dns'})
net.listen('0.0.0.0', 443, {kind = 'doh2'})
net.listen('0.0.0.0', 853, {kind = 'tls'})
net.listen('0.0.0.0', 8453, {kind = 'webmgmt'})

hints.add_hosts('/etc/knot-resolver/hosts.generated')

policy.add(policy.suffix(policy.PASS, policy.todnames({'backpack.test.'})))
