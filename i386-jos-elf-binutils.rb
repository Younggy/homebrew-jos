class I386JosElfBinutils < Formula

  desc "FSF Binutils for i386-elf development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.25.1.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.25.1.tar.gz"
  sha256 "82a40a37b13a12facb36ac7e87846475a1d80f2e63467b1b8d63ec8b6a2b63fc"

  depends_on "gcc" => :build

  def install
    gcc = Formula.factory "gcc"

    args = [
      "--prefix=#{prefix}",
      "--disable-werror",
      "--disable-nls",
      "--target=i386-jos-elf"
    ]

    ENV["CPP"] = "#{gcc.bin}/cpp-5"
    ENV["CC"]  = "#{gcc.bin}/gcc-5"
    ENV["CXX"] = "#{gcc.bin}/g++-5"
    ENV["LD"]  = "#{gcc.bin}/gcc-5"

    system "./configure", *args
    system "make"
    system "make", "install"

    info.rmtree
  end
end
