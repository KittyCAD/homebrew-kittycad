class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.26/kittycad-cli.tar.gz"
  sha256 "89d3fd10a54d276ebfb15057577afed7c6b354c451ab13790d5a80a49ef891fb"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "bde9c2949e64d059c18d8f93566a64dafc6d2e8e259a70322fb804831dfd0b5b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "bde9c2949e64d059c18d8f93566a64dafc6d2e8e259a70322fb804831dfd0b5b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "bde9c2949e64d059c18d8f93566a64dafc6d2e8e259a70322fb804831dfd0b5b"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "bde9c2949e64d059c18d8f93566a64dafc6d2e8e259a70322fb804831dfd0b5b"
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
