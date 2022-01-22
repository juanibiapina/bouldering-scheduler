{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    heroku
    ruby_3_1
    geckodriver
    firefox
  ];
}
