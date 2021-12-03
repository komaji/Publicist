class Publicist < Formula
  desc "Publicist is a tool for changing swift internal access level into public."
  homepage "https://github.com/komaji/Publicist"
  url "https://github.com/komaji/Publicist/archive/0.1.0.tar.gz"
  sha256 "6e49d125e77057bc4a25e5109a32248a8226cc884e734b2024de8254ddf95e37"
  license "MIT"

  depends_on :xcode

  def install
    system 'make', 'build'
    bin.install "#{buildpath}/.build/release/publicist"
  end
end
