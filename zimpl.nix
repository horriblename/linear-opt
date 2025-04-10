{
  src,
  cmake,
  bison,
  gmp,
  flex,
  zlib,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "zimpl";
  version = "git";

  nativeBuildInputs = [bison flex cmake];
  buildInputs = [gmp zlib];

  inherit src;
}
