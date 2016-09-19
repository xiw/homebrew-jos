class I386JosElfBinutils < Formula

  desc "FSF Binutils for i386-elf development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftpmirror.gnu.org/binutils/binutils-2.27.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz"
  sha256 "26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f"

  def install
    args = [
      "--prefix=#{prefix}",
      "--disable-werror",
      "--disable-nls",
      "--target=i386-jos-elf"
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    info.rmtree
  end
end
