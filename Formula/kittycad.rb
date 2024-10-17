class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.86/kittycad-cli.tar.gz"
  sha256 "ce4ed74d351003f9dbf7bf053b439b7523c8104871b51e5ccee3e61e709d76de"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "46f87af8099693b803b3e31bece2ea76a13e60597e5eb39e6f942ce6280f4aae"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "64b919f073256085d855e68abcc4c8c673eb0ee0a123aaa07352350470c4e314"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7e3ae1268267f15cf22c8337c77d18c9965b3ea16a32f38b3850b061047f65d6"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "0b414c7becaee07303925a9548bbc255d636cfa96d5fc0f4489aefbf7e329c32"
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
