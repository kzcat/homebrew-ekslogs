class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "d8f6d8556b3bc96032f3a31e9bd4256b5745765c83b83c1d6d922af6bc86c66b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
