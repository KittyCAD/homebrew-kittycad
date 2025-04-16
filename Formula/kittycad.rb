class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.109/kittycad-cli.tar.gz"
  sha256 "4d25ef72204b0f37242f03d583a23f9e2efac4e7599be2b3e086d45aae715713"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "3e37af5c91427b0f24985831b6ab998a9ab7547a48054b8c2380a57eca659e3b"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "894a32407f8b04e3e0f772c68e7bc60bef02909e3ce5fe2ec05c27ef92f16823"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b21e02817d37f42ca7588ef7752e140cda3e109305135574b060fc39105774d0"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "f602f0e7182f9db186e806b9bf6acc9b5bd696f0f303c67641e2e00767a39ea8"
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
