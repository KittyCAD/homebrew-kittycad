class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.154/kittycad-cli.tar.gz"
  sha256 "863f40b891ac6cfbc39398db0d87877f0285c644f449d00c4f507fce03178a14"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "00d2d0dac57f67479636c6bc26b5af0622e370183ee9fc6b2e51446891782ec7"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "aa8dbfd66bbe52e31c9a8d2259ccb5814b2a1ec6c22626efc77bdd449cba7e1b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1726e96348565e6a83710f77d1a5db573cfecc56485d27ea929854c2086952f8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "80c3facc8ad669f3b1b64ab504f417fb34c857e449632e6fc666ee8ba6720899"
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
