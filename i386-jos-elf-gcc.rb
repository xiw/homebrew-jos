class I386JosElfGcc < Formula

  desc "GNU compiler collection for i386-elf development"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2"
  sha256 "5f835b04b5f7dd4f4d2dc96190ec1621b8d89f2dc6f638f9f8bc1b1014ba8cad"

  depends_on "gmp"
  depends_on "libmpc"
  depends_on "mpfr"
  depends_on "i386-jos-elf-binutils"
  depends_on "gcc" => :build

  def install
    languages = %w[c]

    binutils = Formula.factory "i386-jos-elf-binutils"
    gcc = Formula.factory "gcc"

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

    ENV["CPP"] = "#{gcc.bin}/cpp-5"
    ENV["CC"]  = "#{gcc.bin}/gcc-5"
    ENV["CXX"] = "#{gcc.bin}/g++-5"
    ENV["LD"]  = "#{gcc.bin}/gcc-5"

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
