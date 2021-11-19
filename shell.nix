{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    ruby_3_0
    geckodriver
    firefox
  ];
}
