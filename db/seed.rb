Brand.create name: 'Nine West'
Brand.create name: 'Manolo Blahnik'
Brand.create name: 'Christian Louboutin'

Shoe.create :name => 'Violators', :description => 'Awesomeness', :brand_id => 1, :release_month => 'January', :image_path => 'shoe1.jpg'
Shoe.create :name => 'Terminators', :description => 'These are awesome', :brand_id => 2, :release_month => 'February', :image_path => 'shoe2.jpg'
Shoe.create :name => 'Shit Kickers', :description => 'Wonky awesome', :brand_id => 3, :release_month => 'January', :image_path => 'shoe3.jpg'
Shoe.create :name => 'Toe Holders', :description => 'Awesomer than you!', :brand_id => 3, :release_month => 'September', :image_path => 'shoe4.jpg'