require "capybara"
require "capybara/dsl"
require "byebug"
require "chronic"

require_relative "lib/scheduler"

def load_user
  YAML.load(File.read("data/user.yml"))
end

# read arguments
gym_name = ARGV[0]
human_date = ARGV[1]
time = ARGV[2]

# calculate day
date = Chronic.parse(human_date)
day = date.day.to_s
month = date.month

# configure_capybara
Capybara.default_driver = :selenium
Capybara.run_server = false

# load user data
user = load_user

# schedule
if gym_name == "basement"
  Scheduler.new.schedule_basement(user, day, month, time)
elsif gym_name == "boulderklub"
  Scheduler.new.schedule_boulderklub(user, day, month, time)
end
