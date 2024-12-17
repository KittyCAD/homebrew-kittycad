class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.92/kittycad-cli.tar.gz"
  sha256 "eab6b764d52cf31397543f113895a07a9a75aa59f5d5a3e19a16010ab938bc96"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "761f9fbbf7c55d70dd785a3c5be1715861b0beb19888f3941190baf5e9ca16c5"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "59adc3128b3bd8440e7aba2dae5c615a6bed201bd6aa3f5a07f13b0c08dd14ad"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "ff92ccf95335eae6889d72a7d66b5c563859eeb02f664984ca98c5e348686ed4"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "4487a2e2db4d10ac304ce0710dbd3618ad744d24579d8b298bf6856c6619d0bf"
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
