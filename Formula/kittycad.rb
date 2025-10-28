class Kittycad < Formula
  desc " is a command-line interface to Zoo for use in your terminal or your scripts."
  homepage "https://zoo.dev/docs/cli/manual"
  url "https://dl.zoo.dev/releases/cli/v0.2.128/kittycad-cli.tar.gz"
  sha256 "3b568130f6ccfec7da5f2b6d2da4a34676e08a14b8edcc856eda42e6ec19c9e8"


  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "2bb01640f3c0f59a0f67b8ed7df50ed000e475e0dcc87f4a10e06e006045872f"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e4653ec09164a95da6b6edba858d52e5914f8c8e3264d6e0316e27d2534efc65"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "a8ab87317fc250b79e1a387ea0e71bd52b7160316aed5a2878071b6f646a2c51"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "f1c74aadf78223b59200991ede44ac57a37972031195f72ea11196dd2e1fe1a7"
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
