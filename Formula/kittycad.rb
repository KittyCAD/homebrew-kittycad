class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.164/kittycad-cli.tar.gz"
  sha256 "a9062d0744b05083c7f0075334ddfbaf1856864a7040f5712fef21877165e958"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "def0820f09a1741a1460af2f12c6e8eb78659a07a5c7d54db0b8cf50c93ce379"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "c2c4a4fd55fa59a0b3cbe86ee84ef9daffd0de9366beb947981e6b8a5aba348b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9612647d5c14ccd5aff9b3bbcf5e2f7c6ab34ff58ceb57a7b72a4357a31e8f8f"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3fc29b9a9e2211e007f795a6d85a92d996e28ad5c44e3f4f03564d1c0ad7c285"
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
