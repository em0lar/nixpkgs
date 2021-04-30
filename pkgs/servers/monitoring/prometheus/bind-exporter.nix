{ lib, buildGoModule, fetchFromGitHub, nixosTests }:

buildGoModule rec {
  pname = "bind_exporter";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "prometheus-community";
    repo = "bind_exporter";
    rev = "v0.4.0";
    sha256 = "sha256-exhLATg+PPjgL+g2F4o2PbjVNDxi9ziMOevz4KaJXZQ=";
  };

  vendorSha256 = "sha256-KlRO5wgYTyEF2B1x0Ry5uNwRqjGaZavmhZ7COVnGSpw=";

  passthru.tests = { inherit (nixosTests.prometheus-exporters) bind; };

  meta = with lib; {
    description = "Prometheus exporter for bind9 server";
    homepage = "https://github.com/prometheus-community/bind_exporter";
    license = licenses.asl20;
    maintainers = with maintainers; [ rtreffer em0lar ];
    platforms = platforms.unix;
  };
}
