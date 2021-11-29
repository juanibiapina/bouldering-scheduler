# Bouldering scheduler

Script to automatically schedule bouldering sessions at Boulderklub or Basement.

## Installation

Make sure all dependencies are installed (consult shell.nix for a list) and run `bundle install`.

## Usage

- Copy `data/user.yml.template` to `data/user.yml` and fill in your personal user data
- Change the method call in the source code to select which gym to schedule
- Change the script input in the source code to set the `day` and `time`
- run `bundle exec ruby main.rb`

The last step in the process is not automated so you have the opportunity to
review everything in the browser window before confirming.
