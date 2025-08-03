class Ekslogs < Formula
  desc "A fast and intuitive CLI tool for retrieving and monitoring Amazon EKS cluster Control Plane logs"
  homepage "https://github.com/kzcat/ekslogs"
  url "https://github.com/kzcat/ekslogs/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "acb0f18e67816b37b42d734e585d82a9e8ec50bb6460babf3eaaaf24b63f4711"
  license "MIT"
  
  depends_on "go" => :build
  
  def install
    ldflags = %W[
      -s -w
      -X github.com/kzcat/ekslogs/cmd.version=v0.1.8
      -X github.com/kzcat/ekslogs/cmd.commit=homebrew-v0.1.8
      -X github.com/kzcat/ekslogs/cmd.date=#{Time.now.utc.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end
  
  test do
    assert_match "ekslogs version", shell_output("#{bin}/ekslogs version")
  end
end
