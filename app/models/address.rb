class Address < ApplicationRecord

    def country_name
        code_country = ISO3166::Country[country]
        code_country.translations[I18n.locale.to_s] || code_country.name
      end
end
