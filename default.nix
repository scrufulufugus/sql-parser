{ lib,
  stdenv,
  fetchFromGitHub,
  makeWrapper,
  bison,
  flex
}:

stdenv.mkDerivation rec {
  pname = "sql-parser";
  version = "0.0.1";

  src = ./.;

  buildInputs = [ bison flex ];
  nativeBuildInputs = [ makeWrapper ];

  enableParallelBuilding = true;

  preInstall = ''
    sed -i "s|^\(INSTALL\s*=\s*\).*|\1$out|g" Makefile;
    mkdir -p $out/{lib,include};
  '';

  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/hyrise/sql-parser";
    description = "C++ SQL Parser";
    platforms = platforms.unix;
  };
}
