# frozen_string_literal: true

require "scheduler"

class SessionsController < ApplicationController
  # POST /sessions
  def create
    gym_name = session_params["gym_name"]
    human_date = session_params["human_date"]
    time = session_params["time"]
    user = user_params

    # calculate day
    date = Chronic.parse(human_date)
    day = date.day.to_s
    month = date.month

    if gym_name == "basement"
      Scheduler.new.schedule_basement(user, day, month, time)
    elsif gym_name == "boulderklub"
      Scheduler.new.schedule_boulderklub(user, day, month, time)
    end

    render json: {}, status: :ok
  end

  private

  def user_params
    @user_params ||= params.fetch(:user, {})
  end

  def session_params
    @session_params ||= params.fetch(:session, {})
  end
end
