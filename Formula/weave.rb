class Weave < Formula
  desc "MCP pack manager for AI CLIs (Claude Code, Gemini CLI, Codex CLI)"
  homepage "https://github.com/PackWeave/weave"
  # Update url and sha256 when a tagged release is published.
  # Run: brew fetch --build-from-source PackWeave/tap/weave
  # to regenerate the sha256 after updating the url.
  url "https://github.com/PackWeave/weave/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "bd71a51a42f5798671c989f55c6d97152a9d5327289cb23df2d6a26d2d186c6f" # update on release
  license "Apache-2.0"
  head "https://github.com/PackWeave/weave.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "weave", shell_output("#{bin}/weave --version")
  end
end
