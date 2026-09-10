class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.195/kittycad-cli.tar.gz"
  sha256 "67ae97e3a51240ba4abca111b4b633aff58725c7fa1834f4889eb3a4a7ad358d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "10379b068e30ddec73c0fcec5e1baad0501ba6891eea914bcb5e4dc51aae824e"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "96490b010d569229143321722f5db8dd652ba94f92c377fbde8e002aa6ec6c43"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9a05bded8bb01188ac82d0369f1a76e520a0c76949611cefa699678fe1404cef"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "e0af5ef6f9dedff47a8faeb52506ccf30a278737350aa255024b7f21f9f2e65f"
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
