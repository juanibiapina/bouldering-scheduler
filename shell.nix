{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    firefox
    geckodriver
    heroku
    ruby_3_1
  ];
}
