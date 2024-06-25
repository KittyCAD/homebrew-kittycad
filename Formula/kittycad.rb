class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.61/kittycad-cli.tar.gz"
  sha256 "0ff6fa12bd6e09e69d989c400c57bfc5ffc76b47d649dc422c3328b91323e6a9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c6c8c6a7890de8863e89f8b0c2db5c550728979afb7818666fd6bbd9f5b31db1"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "862817f2821beb29fc6e0b1282f303e3db3a20684b7b0338a674ddac598030b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7f3361be1f200658fd78a6d044e7383de1a28a87b6ab21e02f118841b0bc017b"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "6aed3235cc34f8939a3f78d148df85d82dbc4527a0983d26bd6af0f9f3f78063"
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
