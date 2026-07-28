class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.3"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.3/godns_3.4.3_darwin_arm64.tar.gz"
      sha256 "f1ec6330a887df15470462cb5feb8c8080eeac973c9bef9759ca4f071b442ef3"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.3/godns_3.4.3_darwin_amd64.tar.gz"
      sha256 "1b13e5d4ef7fa48b5b5bb09a5b3a1879d2467e3b4df9bc29a6aa52c773e65cf1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.3/godns_3.4.3_linux_arm64.tar.gz"
      sha256 "7b8c0f5b9ff60b4a1904e84056677196bf39c0525f9f8c40adaf9756c1a3c244"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.3/godns_3.4.3_linux_amd64.tar.gz"
      sha256 "a36a077a02927db4a5ae4e8ff821c8f566122cbd318d07ef592d8b21b3f827e2"
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
