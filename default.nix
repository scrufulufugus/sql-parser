{ lib,
  stdenv,
  fetchFromGitHub,
  bison,
  flex
}:

stdenv.mkDerivation rec {
  pname = "sql-parser";
  version = "0.0.1";

  src = ./.;

  buildInputs = [ bison flex ];

  enableParallelBuilding = true;

  installPhase = ''
    install -Dm644 src/*.h -t "$out/include/"
    install -Dm644 src/sql/*.h -t "$out/include/sql/"
    install -Dm755 libsqlparser.so -t "$out/lib/"
  '';

  doCheck = false;

  checkPhase = ''
    runHook preCheck
    make test_install
    runHook postCheck
  '';

  meta = with lib; {
    homepage = "https://github.com/klundeen/sql-parser";
    description = "C++ SQL Parser";
    platforms = platforms.unix;
  };
}
