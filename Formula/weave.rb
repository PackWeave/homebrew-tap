class Weave < Formula
  desc "MCP pack manager for AI CLIs (Claude Code, Gemini CLI, Codex CLI)"
  homepage "https://github.com/PackWeave/weave"
  # Update url and sha256 when a tagged release is published.
  # Run: brew fetch --build-from-source PackWeave/tap/weave
  # to regenerate the sha256 after updating the url.
  url "https://github.com/PackWeave/weave/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "c9409e1175e3e8e8028603faeb944c164829fd89b43301f3f4b42152281a4153" # update on release
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
