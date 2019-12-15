ActiveAdmin.register CountryReference do
  menu parent: "Countries"

  permit_params :title, :author, :publisher, :publication_date, :country_id, :period
  
end
