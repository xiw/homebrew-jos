class I386JosElfGcc < Formula

  desc "GNU compiler collection for i386-elf development"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-5.3.0/gcc-5.3.0.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/gcc/gcc-5.3.0/gcc-5.3.0.tar.bz2"
  sha256 "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "i386-jos-elf-binutils"

  def install
    languages = %w[c]

    binutils = Formula.factory "i386-jos-elf-binutils"

    args = [
      "--prefix=#{prefix}",
      "--enable-languages=#{languages.join(",")}",
      "--disable-werror",
      "--disable-nls",
      "--disable-libssp",
      "--disable-libmudflap",
      "--disable-multilib",
      "--with-as=#{binutils.bin}/i386-jos-elf-as",
      "--with-ld=#{binutils.bin}/i386-jos-elf-ld",
      "--with-newlib",
      "--without-headers",
      "--target=i386-jos-elf"
    ]

    mkdir "build" do
      system "../configure", *args
      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"
    end

    info.rmtree
  end
end
