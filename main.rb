require "capybara"
require "capybara/dsl"
require "byebug"

class Scheduler

  include Capybara::DSL

  def schedule
    # capybara configuration
    Capybara.default_driver = :selenium
    Capybara.run_server = false

    # select URL
    Capybara.app_host = 'https://boulderklub.de'

    # inputs
    day = "26"
    time = "08:00 - 10:00" # this has to look like the exact text on the page

    # load user data
    user = YAML.load(File.read("data/user.yml"))

    visit("/")

    # click day
    find('.drp-calendar-day', text: day).click # only if the correct month is already selected

    # click book button on chosen time
    find(".drp-course-date-item", text: time).find_button(text: "BUCHEN").click

    # fill in user data
    fill_in("Vorname*", with: user["name"])
    fill_in("Nachname*", with: user["last_name"])
    fill_in("Geburtsdatum* (TT.MM.JJJJ)", with: user["birthday"])
    fill_in("Straße und Hausnummer*", with: user["address"])
    fill_in("Postleitzahl*", with: user["postal_code"])
    fill_in("Stadt*", with: user["city"])
    fill_in("Mobilnummer*", with: user["phone_number"])
    fill_in("Email*", with: user["email"])
    select(user["type"])
    fill_in("Mietgliedsnummer USC*", with: user["usc_number"])

    byebug

    # click submit button
    # find(".drp-course-booking-continue").click
  end
end

Scheduler.new.schedule
