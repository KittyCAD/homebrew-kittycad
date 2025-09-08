class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.119/kittycad-cli.tar.gz"
  sha256 "572d1312f1e5e80225fd239b5b3ea1ebed1f163512738667b4f23f965d23aa0f"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "7df4e30e3cad548860b25e7181b2a72822c88aa9c8b115cbc96575b159ed0e1c"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "81282a92ab7d1948fb916deb2dd4528383654759f779c7bf1362beeb0927831f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "399a229fa9de332a4973584163cf304adfd2769905d2e7042add3074f02aead2"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "039c86c4563628adf9dafdd41699e944fc54d90e4e92f8c4d42a0b75390d7876"
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
