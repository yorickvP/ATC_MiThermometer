{ stdenv
, fetchurl, autoPatchelfHook
, zlib, ncurses5, expat, libusb, libusb-compat-0_1
}:

stdenv.mkDerivation {
  pname = "tc32-gcc";
  version = "2.0";

  src = fetchurl {
    url = "http://shyboy.oss-cn-shenzhen.aliyuncs.com/readonly/tc32_gcc_v2.0.tar.bz2";
    sha256 = "0c5lj5wxwmjr1558cqnmskgr877ashndmkfsnjjdpcrx7sz59f1k";
  };

  buildInputs = [
    zlib ncurses5 expat
    libusb libusb-compat-0_1
  ];

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  unpackPhase = ''
    tar xf $src
  '';

  installPhase = ''
    mkdir $out
    cp -r tc32/bin $out/bin
    cp -r tc32/lib $out/lib
    cp -r tc32/share $out/share
    # ...
    cp -r tc32/include $out/include
    cp -r tc32/tc32-elf $out/tc32-elf
  '';

  meta = {
    description = "Toolchain for the Telink TC32 platform, as prebuilt gcc binaries";
    platforms = [ "x86_64-linux" ];
  };
}

