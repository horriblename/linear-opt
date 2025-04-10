{
  stdenv,
  pkg-config,
  cmake,
  src,
  zlib,
  readline,
  gmp,
  papilo,
  tbb,
}:
stdenv.mkDerivation {
  pname = "scip";
  version = "git";

  inherit src;

  nativeBuildInputs = [cmake pkg-config tbb];
  buildInputs = [zlib readline gmp papilo];
}
