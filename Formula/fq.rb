class Fq < Formula
  desc "Force-quit macOS applications from the command-line, like the Force Quit dialog"
  homepage "https://github.com/topce/fq"
  url "https://github.com/topce/fq/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "77d473b51ef53515028326356d1d6376fc2f7f365f147f1600ec840239211ad5"
  license "MIT"

  depends_on "dune" => :build
  depends_on "ocaml" => :build

  # macOS-only: relies on lsappinfo(1), ps, and SIGKILL on GUI applications
  depends_on :macos

  def install
    # stdlib + unix only, so a plain dune build suffices (no opam needed)
    system "dune", "build", "--profile", "release"
    bin.install "_build/default/bin/main.exe" => "fq"
  end

  test do
    assert_match "fq 0.3.0", shell_output("#{bin}/fq --version")
    assert_match "fq", shell_output("#{bin}/fq --help")
  end
end
