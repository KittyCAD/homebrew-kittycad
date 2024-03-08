class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.23/kittycad-cli.tar.gz"
  sha256 "86df0455acd4649ee21ebab50369748d1f3397187014018d7991f55052f5ebc3"


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
