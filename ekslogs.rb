class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "b44b37879f4a8c4a2f078d90b37b8b8f3d9f91c6a848d7463a353e876fcfc2bf"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    ldflags = %W[
      -s -w
      -X github.com/kzcat/ekslogs/cmd.version=v0.1.9
      -X github.com/kzcat/ekslogs/cmd.commit=homebrew-v0.1.9
      -X github.com/kzcat/ekslogs/cmd.date=#{Time.now.utc.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end
  
  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
