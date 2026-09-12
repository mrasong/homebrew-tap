class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.4"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.4/godns_3.4.4_darwin_arm64.tar.gz"
      sha256 "fd768e551828b9b17283a6c845603ea8fc7c94356da7248c9209d62fd12fbb44"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.4/godns_3.4.4_darwin_amd64.tar.gz"
      sha256 "ca2dfdf3b321324641eb2c91af18c1b0582c4ba8a52041f9a1416dc3635ab355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.4/godns_3.4.4_linux_arm64.tar.gz"
      sha256 "4e7b777b80fbf5541813304903b0b00261d7900a0a4996ab592ce07e112a6d15"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.4/godns_3.4.4_linux_amd64.tar.gz"
      sha256 "c465d60e4f2701bf6dbe378d6f4d66b72d82ed30a42ad6878992208d1a26183a"
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
