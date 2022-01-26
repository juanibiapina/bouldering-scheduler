# frozen_string_literal: true

require "scheduler"

class API < Grape::API
  format :json

  rescue_from Scheduler::SafetyCheckError do |e|
    error!(e, 422)
  end

  rescue_from :grape_exceptions

  mount SessionsAPI
end
