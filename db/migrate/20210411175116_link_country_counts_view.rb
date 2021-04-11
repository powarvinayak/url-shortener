class LinkCountryCountsView < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      drop view if exists link_country_counts
    SQL

    execute <<-SQL
      create view link_country_counts AS
      select link_id, country, count(country) from stats group by link_id, country order by link_id, count(country) desc
    SQL

  end
end
