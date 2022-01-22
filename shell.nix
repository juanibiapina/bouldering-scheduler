{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    docker-compose
    firefox
    geckodriver
    heroku
    postgresql
    ruby_3_1
  ];
}
