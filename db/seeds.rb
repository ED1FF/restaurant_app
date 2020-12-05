# frozen_string_literal: true

Constants::Cities::UKRAINE.each { |city_name| City.create(country: 'Ukraine', name: city_name) }
