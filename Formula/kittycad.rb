class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.156/kittycad-cli.tar.gz"
  sha256 "b76bd3a817a9caf6630eac366fb6de6ee2d2fde785c0781f811ee068befc85fb"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7ae3dac7ad452c11a2edd1e75ca32c98b7ec5dc4529fb5dd1df1c961e3f94a7b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "1fb7a137d67c34328bb3b94ba5be71770a2a69b3b721d42bbd34c0b583745fdc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "468737eb0ff2422c4535dca844d158bf43938c0d3e6e416d99e66ced17eadc24"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "60b6422e38a07212d051a490d55438d89fe1caf730db9953177d0d610efc3e22"
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
