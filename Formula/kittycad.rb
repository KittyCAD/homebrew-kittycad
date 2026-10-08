class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.203/kittycad-cli.tar.gz"
  sha256 "ae7ec9fdfcf2dabafd60b6b2dbe04a314d353915895e9eda84c422a0ca561df8"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "666fb29804510a688c7b7d581bcc606b2e871832b7d5f8b4b3ef31b54eae5a88"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "f7492dc02bdc9a7fb209310c795161b4f12108e5297702b576689b24d0e61659"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "86a72e94136cf0fc0acaaef309bab79f9c940d89c278689b69dfcc44231df43c"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c1a8cf5f19875aba773778e84e10a0b5179598c5d6b0d3378b58fd6daa6c0177"
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
