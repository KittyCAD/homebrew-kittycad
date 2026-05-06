class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.163/kittycad-cli.tar.gz"
  sha256 "4cc1da28d40c6f1fd1b152ab976482051d49226912b08c298e28fdc83c9d191d"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "2a58885921156369359080c5f53c5e1ea52da5204a6a85659d6eea538d5197b5"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "fe58ac373cf3014582c635303013073ecacbdd287462ab1f04066d35dccbfc5c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3ec2d97b1caed6f9ae69d14116a00e92a16446bea0c581c26e8bfc7e8c4468f8"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "5eeba62ffe8f5a5881ca02f3b4266f3b9934e2149b297f1d185d9fe6311be395"
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
