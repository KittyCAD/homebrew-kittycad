class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.106/kittycad-cli.tar.gz"
  sha256 "83d5b605caac53f04667c131b23fb65f918d5a80d6cd0766cfac83b9d82c37f1"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "e48e8b372bd824c29abd63336950d1edf8e2ec4a0319edb57ac6acdc6bb18feb"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "ce1c611114508c09d4f56445d60d65e4dd56c377cbd7bc59e9a5944b8fcda7f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e909101058ce050133abfacd07923c026df48d94f9edd4b962df0330a3076b5a"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "1be014d0cc3c331eafe4fb87163bd3c22dff31b6fb413d7b69d55f12cc3469ab"
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
