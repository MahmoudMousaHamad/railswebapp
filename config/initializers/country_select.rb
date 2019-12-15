CountrySelect::FORMATS[:with_data_attr] = lambda do |country|
    [
        country.name,
        country.name,
        {
            'data-country-code' => country.country_code,
            'data-alpha3' => country.alpha3
        }
    ]
  end
  