class Godns < Formula
  desc "GoDNS is a self-hosted dynamic DNS (DDNS) client with multi-provider support and a built-in web panel."
  homepage "https://github.com/TimothyYe/godns"
  license "Apache-2.0"
  version "3.4.6"

  on_macos do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.6/godns_3.4.6_darwin_arm64.tar.gz"
      sha256 "cd4996b96ddedae88b9abc641cfc8cff2552fc2c25b25b91d8b6388e9b11f90a"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.6/godns_3.4.6_darwin_amd64.tar.gz"
      sha256 "4bd82026129e7ecc720d07937fa33ee75a6c5d75af8c3dd4cbefbe36ab52183b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.6/godns_3.4.6_linux_arm64.tar.gz"
      sha256 "92a9b866b2f639b5b358f1f45e4d2cdb2dbf5bf4f9b6c3cd4cdb10cd2e94ce2a"
    end

    on_intel do
      url "https://github.com/TimothyYe/godns/releases/download/v3.4.6/godns_3.4.6_linux_amd64.tar.gz"
      sha256 "f937a0c1d41f26398d6e5c551d10d8d78d2b211cc197bd4683aab8e77f8f87d8"
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
