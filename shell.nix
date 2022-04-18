{ pkgs ? import <nixpkgs> {} }:

let
  packages = with pkgs; [
    chromedriver
    docker
    geckodriver
    heroku
    libxml2
    postgresql
    ruby_3_1
  ]
  ++ lib.optional stdenv.isLinux firefox;
in pkgs.mkShell {
  nativeBuildInputs = packages;
}
