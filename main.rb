require "capybara"
require "capybara/dsl"
require "byebug"
require "chronic"

class Scheduler

  include Capybara::DSL

  def configure_capybara
    Capybara.default_driver = :selenium
    Capybara.run_server = false
  end

  def load_user
    YAML.load(File.read("data/user.yml"))
  end

  def schedule_basement
    configure_capybara

    # inputs
    date = Chronic.parse("this saturday")
    time = "10:30 - 12:30" # this has to look like the exact text on the page

    # calculate day
    day = date.day.to_s

    # load user data
    user = load_user

    # select URL
    Capybara.app_host = 'https://basement-boulderstudio.de/'

    # visit website
    visit("/booking")

    # select regular slots (after 14 or weekends)
    find(".drp-course-list-item-regulaere-slots").click

    # click day
    find(".drp-calendar-day.drp-calendar-day-dates", text: day).click # only if the correct month is already selected

    # click book button on chosen time
    find(".drp-course-date-item", text: time).find_button(text: "Buchen").click

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
    fill_in("Mitgliedsnummer USC*", with: user["usc_number"])

    # click submit button
    find(".drp-course-booking-continue").click

    byebug
  end

  def schedule_boulderklub
    configure_capybara

    # inputs
    day = "11"
    time = "18:30 - 20:30" # this has to look like the exact text on the page

    # load user data
    user = load_user

    # select URL
    Capybara.app_host = 'https://boulderklub.de'

    # visit website
    visit("/")

    byebug

    # click day
    find('.drp-calendar-day', :text => /\A#{day}\z/).click # only works if the correct month is already selected

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

    # click submit button
    find(".drp-course-booking-continue").click

    byebug
  end
end

Scheduler.new.schedule_basement
