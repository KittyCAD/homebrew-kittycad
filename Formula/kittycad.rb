class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.101/kittycad-cli.tar.gz"
  sha256 "8668eba8f83ec8c040197e03126b67ae823a340274b14edfa9db3f2a2f9bf6e9"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "3368bf967240b7762324838f8aea31fc445d7bc575e0cd965861f79400597050"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "720f105b9f71b181085025c5644d62af232e26688a7e9d05e69a27a781cfff69"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "41762230bc17fe383879cfcc7632ee1488cec38f79c018024c81e5811eaf08e8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "d9e6fdbc29d881330b7b7da48a1cfdc5d1cefd32cec5cdb4e0dee52edbdf3ec6"
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
