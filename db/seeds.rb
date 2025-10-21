# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Watch Brands by Country
brands_by_country = {
  "Switzerland" => [
    "Rolex", "Patek Philippe", "Omega", "TAG Heuer", "Longines", "Tissot",
    "Breitling", "IWC Schaffhausen", "Jaeger-LeCoultre", "Vacheron Constantin",
    "Audemars Piguet", "Blancpain", "Zenith", "Chopard", "Alpina"
  ],
  "Germany" => [
    "A. Lange & Söhne", "Glashütte Original", "Nomos Glashütte", "Sinn",
    "Stowa", "Laco", "Junghans", "Hanhart", "Tutima", "Mühle-Glashütte",
    "Wempe", "Chronoswiss", "Union Glashütte", "Bruno Söhnle"
  ],
  "Japan" => [
    "Seiko", "Citizen", "Casio", "Orient", "Grand Seiko", "Credor",
    "Minase", "Knot", "Campanola", "Presage", "Miyota", "Kurono Tokyo",
    "Mechanical Moon", "Hajime Asaoka", "Micro Artist Studio"
  ],
  "United States" => [
    "Timex", "Bulova", "Hamilton", "Shinola", "Weiss", "RGM Watch Co.",
    "Keaton Myrick", "Vortic Watch Company", "Kobold", "Niall",
    "Detroit Watch Company", "Martenero", "Oak & Oscar", "MKII"
  ],
  "France" => [
    "Cartier", "Hermès", "Breguet", "Chaumet", "Baume & Mercier",
    "Bell & Ross", "Lip", "Yema", "Michel Herbelin", "Pequignet",
    "Awake Paris", "Charlie Paris", "Baltic", "Reservoir"
  ],
  "Italy" => [
    "Panerai", "Bulgari", "U-Boat", "Locman", "Meccaniche Veneziane",
    "Anonimo", "Spinnaker", "Visconti", "Giuliano Mazzuoli", "Eberhard & Co.",
    "Lorenz", "Mido Milano", "Perseo"
  ],
  "United Kingdom" => [
    "Bremont", "Christopher Ward", "Smiths", "Arnold & Son", "Graham",
    "Roger W. Smith", "Garrick", "Schofield", "Marloe Watch Company",
    "Fears", "Farer", "Vertex", "Pinion", "Lorier"
  ],
  "Sweden" => [
    "Kronaby", "Sjöö Sandström", "Triwa", "Daniel Wellington", "Larsson & Jennings",
    "About Vintage", "Brathwait", "MVMT", "August Berg", "Nordgreen",
    "Cluse Stockholm", "Carl Edmond"
  ],
  "Finland" => [
    "Suunto", "Stepan Sarpaneva", "Aatos", "Rönkkö", "Armor",
    "Hannes Hyötynen", "Sarpaneva Watches", "Kari Voutilainen", "Winland",
    "Nordic Time", "Lahti Precision", "Atro"
  ],
  "Denmark" => [
    "Skagen", "Bering", "Nordgreen", "About Vintage Denmark", "Carlheim",
    "Danish Design", "Piet Hein Eek", "Georg Jensen", "Mondaine Denmark",
    "Vigrid", "Copenhagen Watch", "Larsen & Eriksen"
  ],
  "Norway" => [
    "Viken", "Halden", "Bergen Watch Co.", "Oslo Time", "Fjord Watch",
    "Nordic Blue", "Aurora Borealis", "Svalbard Timepieces", "Trollfjord",
    "Midnight Sun", "Viking Heritage", "Norsk Tid", "Polar Watch"
  ]
}

brands_by_country.each do |country, brands|
  brands.each do |brand_name|
    Watch::Brand.find_or_create_by!(name: brand_name) do |brand|
      brand.country = country
    end
  end
end

puts "Created #{Watch::Brand.count} watch brands across #{brands_by_country.keys.count} countries"
