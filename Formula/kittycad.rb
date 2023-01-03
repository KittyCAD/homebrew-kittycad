class Kittycad < Formula
  desc "Is a command-line interface for the KittyCAD API"
  homepage "https://kittycad.io/docs/cli/manual"
  url "https://dl.kittycad.io/releases/cli/v0.1.4/kittycad-cli.tar.gz"
  sha256 "85b88f04d67de9edd6a1d7c3dc24c251f01331be8a729e27937cd2abf23722c6"
  license "MIT"

  # specify the target architectures for the binary files
  bottle do
    sha256 cellar: :any_skip_relocation, x86_64_darwin:  "5201c8b3feef07e82b374a92dd4d0cc3e7f67bfd7102238f679bda657e42970d"
    sha256 cellar: :any_skip_relocation, aarch64_darwin: "e9b9b312b6514390298c9b82a2e524fde87e3cd332289cb574b9bb81487a4894"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "563169dd1b2109e81d519290c8e2972e4b66795bbc75697cb0f13ce952b18fac"
    sha256 cellar: :any_skip_relocation, aarch64_linux:  "641cc6b71697b074ef7f558bd22284ec818860a7a7454acfa2e3be59433c1c7d"
  end

  def install
    # check the operating system and CPU type and install the appropriate binary
    case [OS.linux?, Hardware::CPU.type]
    when [true, :intel]
      bin.install "x86_64_linux/kittycad"
    when [true, :arm]
      bin.install "aarch64_linux/kittycad"
    when [false, :intel]
      bin.install "x86_64_darwin/kittycad"
    when [false, :arm]
      bin.install "aarch64_darwin/kittycad"
    end
  end

  test do
    version = shell_output("#{bin}/kittycad --version")
    assert_equal version, "kittycad 0.1.4\n"
  end
end
