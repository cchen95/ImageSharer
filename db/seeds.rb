# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
image_list = [
	"http://i.imgur.com/axXH76R.jpg",#1
	"https://i.reddituploads.com/bc20452d0b3c497f99e43545ed40c20c?fit=max&h=1536&w=1536&s=92acddd11614fe24a70228d4d32af998",
	"http://i.imgur.com/blsN3Bl.jpg",
	"http://i.imgur.com/9MVgn54.jpg",
	"http://i.imgur.com/cIm3Fgj.jpg",
	"http://i0.wp.com/cravingsinamsterdam.com/wp-content/uploads/2015/10/img_1208.jpg", #6
	"http://i.imgur.com/8jbG8AL.jpg",
	"http://i.imgur.com/W5mVdin.jpg",
	"http://i.imgur.com/wP1PEXI.jpg",
	"http://i.imgur.com/UtJ2T2R.jpg",
	"http://i.imgur.com/PtmtNgw.jpg", #11
	"http://i.imgur.com/blbgF7k.jpg", 
	"http://i.imgur.com/HlW7WYu.jpg",
	"http://i.imgur.com/cU4ET0Z.png",
	"http://i.imgur.com/Cga0aQX.jpg",
	"http://i.imgur.com/uRVpW7J.jpg", #16
	"http://i.imgur.com/qojQPDE.jpg",
	"http://i.imgur.com/FFy7rqE.jpg",
	"http://i.imgur.com/gSLnTrW.jpg",
	"https://i.imgur.com/9qtVISH.jpg"
]

image_list.each do |link|
	Image.create(link: link)
end