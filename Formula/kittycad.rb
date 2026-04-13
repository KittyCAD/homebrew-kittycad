class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.157/kittycad-cli.tar.gz"
  sha256 "6ada6885d97f8a274d586799ef63f45b6a5b7f1837180737a2ed4fd964b19ebc"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5720b57d55edc1dedead71445224ea506f94ae976914f6279b483a612a026025"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "94b22dcfd44e7350a3bf99f54a871f4c2e4d83475318bed588b84d0253c62d71"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ac668ea4cddce3e04c3515c73dec31da32be565e02bd237ac8477dbe4d4f7198"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "7f80db6e3cd37efcd469367d2a426698a3f3fc58cca25d790273d948def5127f"
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
