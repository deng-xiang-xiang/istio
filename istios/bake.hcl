variable VERSION {
  default = "1.6.3"
}

variable HUB {
  default = "istio"
}

variable BASE_VERSION {
  default = "2020-07-10"
}

group "default" {
  targets = [
    "proxyv2",
    "pilot",
    "operator"
  ]
}

group "proxyv2" {
  targets = [
    "proxyv2-amd64",
    "proxyv2-arm64",
  ]
}

group "pilot" {
  targets = [
    "pilot-amd64",
    "pilot-arm64",
  ]
}


group "operator" {
  targets = [
    "operator-amd64",
    "operator-arm64",
  ]
}


target "proxyv2-arm64" {
  dockerfile = "proxyv2-arm64.Dockerfile"
  tags = [
    "${HUB}/proxyv2:${VERSION}-arm64"
  ]
  args = {
    BASE_DISTRIBUTION = "${HUB}/base:${BASE_VERSION}"
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/arm64"
  ]
}

target "pilot-arm64" {
  dockerfile = "pilot-arm64.Dockerfile"
  tags = [
    "${HUB}/pilot:${VERSION}-arm64"
  ]
  args = {
    BASE_DISTRIBUTION = "${HUB}/base:${BASE_VERSION}"
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/arm64"
  ]
}
target "operator-arm64" {
  dockerfile = "operator-arm64.Dockerfile"
  tags = [
    "${HUB}/operator:${VERSION}-arm64"
  ]
  args = {
    BASE_DISTRIBUTION = "${HUB}/base:${BASE_VERSION}"
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/arm64"
  ]
}


target "operator-amd64" {
  dockerfile = "operator-amd64.Dockerfile"
  tags = [
    "${HUB}/operator:${VERSION}-amd64"
  ]
  args = {
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/amd64"
  ]
}

target "pilot-amd64" {
  dockerfile = "pilot-amd64.Dockerfile"
  tags = [
    "${HUB}/pilot:${VERSION}-amd64"
  ]
  args = {
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/amd64"
  ]
}

target "proxyv2-amd64" {
  dockerfile = "proxyv2-amd64.Dockerfile"
  tags = [
    "${HUB}/proxyv2:${VERSION}-amd64"
  ]
  args = {
    VERSION = "${VERSION}"
  }
  platforms = [
    "linux/amd64"
  ]
}