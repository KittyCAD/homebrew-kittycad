class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.117/kittycad-cli.tar.gz"
  sha256 "1ff78e8dda7613476534b7d083032644c283fb5c6468cea6ddfe66e9495b30af"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "29e86e64c80704e863aab89102c640bd6fdcf98bf6c1f5f6278d4d9955547207"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "9ae14152448f2bceccacc4bffa4739d8d83b49d4eedb65bc9cd96b1cfd501e97"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "58c15d5a22a55a526236cd2cb4316edd96ebd1a4baf84b5afa417025f7404557"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7bb0f95f8be6ec8aa063c41391e7444a25674d382e099aec95880f70399cdf36"
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
