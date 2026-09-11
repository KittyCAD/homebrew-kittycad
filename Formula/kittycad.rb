class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.196/kittycad-cli.tar.gz"
  sha256 "13359aae981709469d4efe7db20cb7bf0fee500a5548b2fbfce5549f74c47102"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5b871a55cfe64bce191bb7037994924801c768e87e47ab4e457e4305b5f452a7"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "311f404d03c4846e7c3a3189546ec0c37c1c3cb547d4e7b39b24d025ba624545"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "63d7c4d1c5ab28ec07031551ed0ada7679f579055c0df32fb535ea2d1aad076e"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "f251b67de5f97dd3a721d7614b7f35ff99b5f0183b1ca3133fc6f6d9d3bca927"
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
