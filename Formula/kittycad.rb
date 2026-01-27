class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.143/kittycad-cli.tar.gz"
  sha256 "80731bd2767ba718af81668d27367387e2988f39c509a99e37ef299e8254bf5f"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "348eae77dca14f331b50621f59d1eade85c3efb3998bdb8d7c12bff1ae17285c"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "54a239bf89485d59892cfc358e664c25b28f06711d21be2516b489da01f90367"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "96357c1d896c2185bab36929c267b4ad14647960a3dda9839585c5397e233bbd"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "c7b77662d156b69590b72469bbc53ca4ae5c52e7ffa9cbafc8d4b611d99167cb"
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
