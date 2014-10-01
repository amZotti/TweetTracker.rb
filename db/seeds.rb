# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sf_keywords = [
  "the",
  "a"
]

vegas_keywords = [
  "and",
  "on"
]

#sf_keywords = [
#  "google san francisco",
#  "google sfo",
#  "goog sfo",
#  "345 spear",
#  "warehouse 6",
#  "warehouse cafe"
#]
#
#vegas_keywords = [
#  "marquee las vegas",
#  "marquee vegas",
#  "marquee cosmo",
#  "marquee cosmopolitan",
#  "marquee club",
#  "@marqueelv",
#  "marquee pool",
#  "marquee nightclub",
#  "marquee dj",
#  "marquee dayclub"
#]

City.create(
  name: "Las Vegas",
  slug: "las_vegas",
  coordinates: [
    "-115.136526",
    "36.159293",
    "-115.129494",
    "36.170043"
  ],
  keywords: vegas_keywords
)

City.create(
  name: "San Francisco",
  slug: "sf",
  coordinates: [
    "-122.394128",
    "37.784106",
    "-122.388130",
    "37.789282"
  ],
  keywords: sf_keywords
)
