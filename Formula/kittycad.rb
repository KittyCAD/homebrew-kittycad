class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.102/kittycad-cli.tar.gz"
  sha256 "c574bf8d4180af3a6880973831643d409788409fffcb41f796ffc2887351151a"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "6666502a999504b5268c28294c78826f0942d5f7efd34b9c383425ffe20bb666"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "16a9ffc1c7aa048556ecb78373f4a63d76fe0411ee10ffca055a9dc18ec9824d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "21843b731d74e7fbf967cd09a700224d834e931f9f73bfd38fb244280e22e2ec"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "cc14723b4cb798781b8d9cf365793a2deb2a80e908c3822ad3321655a8a126ce"
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
