metadata {
  name = "calendso"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/calendso"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "plural"

    args = [
      "wkspace",
      "helm-deps",
    ]

    sha     = "f90688dfde1c844be6c16d8f4374f0218428a67a69754f0059530adb9dac64af"
    retries = 0
    verbose = false
  }
}
