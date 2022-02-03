# frozen_string_literal: true

require "scheduler"

class SessionsAPI < Grape::API
  format :json

  resource :sessions do
    desc 'Create a session.'
    params do
      requires :user, type: Hash do
        requires :name, type: String
        requires :last_name, type: String
        requires :birthday, type: Date
        requires :address, type: String
        requires :postal_code, type: String
        requires :city, type: String
        requires :phone_number, type: String
        requires :email, type: String
        requires :type, type: String
        requires :usc_number, type: String
      end
      requires :session, type: Hash do
        requires :gym_name, type: String
        requires :human_date, type: String
        requires :time, type: String
      end
      optional :dry_run, type: Boolean, default: false
    end
    post do
      gym_name = params["session"]["gym_name"]
      human_date = params["session"]["human_date"]
      time = params["session"]["time"]

      user = params["user"]

      dry_run = params["dry_run"]

      # calculate day
      date = Chronic.parse(human_date)
      day = date.day.to_s
      month = date.month

      if gym_name == "basement"
        result = Scheduler.new.schedule_basement(user, day, month, time, submit: !dry_run)
      elsif gym_name == "boulderklub"
        result = Scheduler.new.schedule_boulderklub(user, day, month, time, submit: !dry_run)
      end

      result.merge(dry_run: dry_run)
    end
  end
end
