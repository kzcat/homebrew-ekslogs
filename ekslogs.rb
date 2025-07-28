class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "4550f4542322aea2018c4e1616493ae6894f5e1512782011d08586318db73d1c"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end
  
  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
