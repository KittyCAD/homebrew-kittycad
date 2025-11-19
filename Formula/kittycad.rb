class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.132/kittycad-cli.tar.gz"
  sha256 "3b7a02ccec7fc94602ab8e1c0dffea38285d9436a846b6ca17cc18386145da08"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "22aa6defce77dcbfab79855f5ce24f84168c2a67d21124e5c7e99362ed8184be"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "b449ed021c3009bb8c87038e9fd17dd9ee6ded323c1f0e5f9e26275cf0ca0662"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f1095e43272560c0352eca519a424576ee0afd553bcd126e43405f8c4ec75563"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "3152624079190123cc0ea095eec9fed87e578082991c71cb65ef6193d00d08e9"
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
