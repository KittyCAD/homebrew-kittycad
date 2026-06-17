class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.178/kittycad-cli.tar.gz"
  sha256 "c1d3d4d2de991e7510ececeec3d2d155887e5779d45e297f85dcdf8233909cc4"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "d41a888042cba1672b61ec2a33820d26df79e1bf828379e3b040d960d5c21d4b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "2c17fda42d0ccc04b3c10f1486c12f087bf912f7837942a5183c6cca22605876"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "238a99e9f65ec0a52396a9247d5b2645b511a3abb4ad26096b48acff0a0e60f1"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "39d4a67c07aea657203c35a5dc1fb8f57d540c3a61fa8b4411dcc7c2e435f369"
  end

  def install
    # check if the user is using Linux and their hardware and install the appropriate binary
    if OS.linux?
      if Hardware::CPU.type == :intel
        bin.install "x86_64_linux/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_linux/zoo"
      end
    else
      if Hardware::CPU.type == :intel
        bin.install "x86_64_darwin/zoo"
      elsif Hardware::CPU.type == :arm
        bin.install "aarch64_darwin/zoo"
      end
    end
  end
end
