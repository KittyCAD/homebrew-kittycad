class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.153/kittycad-cli.tar.gz"
  sha256 "0ad3795765e9d12bba6d992d500f71478b2efc8b33ef8e689c6026cf3c75b1ad"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "486e6c15eefd72454b5754fdb22f122e0a9246ee11ff64c2b365758a334a6210"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "38805d7a28e424fd9cbea46b22999bd8dabe7b1296de117a542a9ebc2fa2773e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "396f55924810e92c9633bbd415c7bc2372a815a3518221c8dc03ca843c71a517"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "74cd0f036b5b5cc34bb77179ce57c77caf59beec4f8acc722a6adacbedd5b364"
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
