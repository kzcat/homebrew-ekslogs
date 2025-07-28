class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.6-test.tar.gz"
  sha256 "3478b7a46ba2c90539479ab92d51b840d1e2388a2cc3090e59ffdc7f114bea51"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end
  
  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
