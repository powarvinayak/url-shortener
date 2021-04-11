module LinksHelper

    def get_top_countries (link)
        top_countries = []
        link.link_country_counts.each do |row|
            top_countries.push(row.country) if row.country
            break if top_countries.length == 3
        end
        top_countries.join(", ")
    end

end
