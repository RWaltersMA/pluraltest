metadata {
  path = "calendso"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Ca8UaC2GK9scda5JlN0DdOk6Rm9RLPkq323k3JlmBxM="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "calendso/terraform"
  target  = "calendso/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Ca8UaC2GK9scda5JlN0DdOk6Rm9RLPkq323k3JlmBxM="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "calendso"
  target  = "calendso/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "calendso",
  ]

  sha     = "h1:Ca8UaC2GK9scda5JlN0DdOk6Rm9RLPkq323k3JlmBxM="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "calendso"
  target  = "calendso/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "64a64db5f205ff6591fcf4fda1f9753aa09cfbfe6ae0773b8aea0834f30a009d"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "calendso"
  target  = "calendso/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "calendso",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "calendso"
  target  = "calendso/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "calendso",
  ]

  sha     = "h1:dBZKp+VXtcFDK9THPs1RSuBKzZKj4HOJJtcJT/wYJuY="
  retries = 1
  verbose = false
}
