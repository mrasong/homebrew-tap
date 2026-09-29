class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.5"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.5/godns_3.4.5_darwin_arm64.tar.gz"
      sha256 "38b8a7c2e5e820fa13c1ef5f698adad5fa74d47cd59b47ce1fc97d6994163aa3"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.5/godns_3.4.5_darwin_amd64.tar.gz"
      sha256 "4cd429bdaee6a31c9e9c73621acb3d91ec9e66c2012c49a4eacb37d5c14ca41d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.5/godns_3.4.5_linux_arm64.tar.gz"
      sha256 "69621369359d2992b90721eff3453e11d63f67d39c2e57bebfa591d7376cf3f0"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.5/godns_3.4.5_linux_amd64.tar.gz"
      sha256 "e44459db28ade50eb0f114a2d4884b62327760d9b00d2b141f5c938dffa65900"
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
