class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.104/kittycad-cli.tar.gz"
  sha256 "b0ced0a43b63b525b922e9f1d82bb4a5d998b70ba1e200959d193ccca88e8add"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "dfc663e6385454291f8efdf57105b8c640233529fced17cc1508e8ce8e60cf49"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "7a97593e574cf3e1504ec5e9de8b0f2e951de022ea12cec94634ea5759f17c77"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1f287b7e6b19af61bcc327a3da5bf106efdfc162faa953e0667b90a931e5187c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "84ad57acd89611836b7364a6be052b98c93e8b7e1226c3a0ea115ff254756b6d"
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
