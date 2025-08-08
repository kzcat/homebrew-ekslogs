class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.11.tar.gz"
  sha256 "e0c0b54fd3c9e0b9c820962a420bd43a11012dd548cef40fb5b9176499ddf527"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    ldflags = %W[
      -s -w
      -X github.com/kzcat/ekslogs/cmd.version=v0.1.11
      -X github.com/kzcat/ekslogs/cmd.commit=homebrew-v0.1.11
      -X github.com/kzcat/ekslogs/cmd.date=#{Time.now.utc.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end
  
  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
