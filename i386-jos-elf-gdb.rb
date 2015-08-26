class I386JosElfGdb < Formula

  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.9.1.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.9.1.tar.xz"
  sha256 "cd9c543a411a05b2b647dd38936034b68c2b5d6f10e0d51dc168c166c973ba40"

  def install
    args = %W[
      --prefix=#{prefix}
      --target=i386-jos-elf
      --disable-werror
      --with-gdb-datadir=#{pkgshare}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    rm_rf include
    rm_rf lib
    rm_rf share/"locale"
    rm_rf share/"info"
  end
end
