# Bouldering scheduler

Automatically schedule bouldering sessions at Boulderklub or Basement.

## Script usage

Make sure all dependencies are installed (consult shell.nix for a list) and run `bundle install`.

- Copy `data/user.yml.template` to `data/user.yml` and fill in your personal user data
- Check Makefile for possible commands

## API Usage

Make a POST request to https://murmuring-caverns-56233.herokuapp.com/sessions with the following payload (fill in your user data):

```json
{
  "user": {
    "name": "Name",
    "last_name": "Last Name",
    "birthday": "01.01.1901",
    "phone_number": "+123445235",
    "email": "name@example.com",
    "type": "Urban Sports Club",
    "usc_number": "222222222"
  },
  "session": {
    "gym_name": "basement",
    "human_date": "this saturday",
    "time": "10:30 - 12:30"
  }
}
```
