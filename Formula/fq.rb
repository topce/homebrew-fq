class Fq < Formula
  desc "Force-quit macOS applications from the command-line, like the Force Quit dialog"
  homepage "https://github.com/topce/fq"
  url "https://github.com/topce/fq/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "8d14b2258efe496cf741c22e221d13ffc014645457074665b81d9a9ca4b3386a"
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
    assert_match "fq 0.3.1", shell_output("#{bin}/fq --version")
    assert_match "fq", shell_output("#{bin}/fq --help")
  end
end
