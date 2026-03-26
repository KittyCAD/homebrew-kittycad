class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.152/kittycad-cli.tar.gz"
  sha256 "b03d0623b2f76edca53ca064715d4e404097ea7ec45cf0182dd0e533be529f13"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "89b99af1b357520f2a909df7767adb418c4c415ac40a5774cc77e6595220ea56"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "31276fcf8741ef43b9b3de8b4e6424957ed59f9084c1be6a8d9c52c6a74f8d22"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f88f9a14dff7cd9f87e5adc2ddf5d04f21b2ca8280fa55fbf82516af06bd5b8b"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5de65fdb08d02a56d2228f28212cf4924174e77536e8f9a293831a042d2f7407"
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
