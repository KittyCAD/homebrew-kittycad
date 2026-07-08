class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.181/kittycad-cli.tar.gz"
  sha256 "d3dd3f89decea37482e57ef3db1d21e90b1ec5b0dd9f76fad3f046aa98c20cb5"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "c59477c3c84ec2fbaec946fa596c0de3a8256ef189dd11481e29667f676298ea"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "3a8a7ac98ff5553bf5d8281ef46904bbad570af7b7413e530cc49b22247b8f63"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ecfdd91be82515aed8f3ea9b4e1e106381a8d14d5ade693b85d03f31fb8dfbc9"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "20fb1387f8e4bffa060779fbdb856e19ba1edace83b8aee4e64d33c245297922"
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
