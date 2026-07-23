class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.2"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.2/godns_3.4.2_darwin_arm64.tar.gz"
      sha256 "e625259c62acd65aac2117284f44b5044fab7e5ffaa4c4bf8d351df732e510b7"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.2/godns_3.4.2_darwin_amd64.tar.gz"
      sha256 "d5fc0458a1507ff1ca8053fb5669aa5a40a000e2d3eda8747372f672f76970f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.2/godns_3.4.2_linux_arm64.tar.gz"
      sha256 "8d228461527acebcbc2658db0d565aa2323f5bb00732c2448db33bae72c40cb7"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.2/godns_3.4.2_linux_amd64.tar.gz"
      sha256 "1a70a9af8ad502635cf833b190d769f96667a41160824b3483f35a51dd7adfd3"
    end
  end

  def install
    bin.install "godns"
  end

  service do
    run [opt_bin/"godns", "-c", etc/"godns.yaml"]
    keep_alive true
    error_log_path var/"log/godns.log"
    log_path var/"log/godns.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/godns -h")
  end
end
