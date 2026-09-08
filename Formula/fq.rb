class Fq < Formula
  desc "Force-quit macOS applications from the command-line, like the Force Quit dialog"
  homepage "https://github.com/topce/fq"
  url "https://github.com/topce/fq/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "91ead081a51c2d398d7c334cec49211b4324e1ca212a5c2094de888cd4ef3264"
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
    assert_match "fq 0.2.0", shell_output("#{bin}/fq --version")
    assert_match "fq", shell_output("#{bin}/fq --help")
  end
end
