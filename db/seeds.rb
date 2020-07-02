# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.create(name: "Resteraunt")
Tag.create(name: "Gym")
Tag.create(name: "Other")
Place.create(name: "24/7 fitness", location: "1 victoria rd", phone: "0211111111", occupancy: 20 , owner_id: 1)
Place.create(name: "Dukes fitness", location: "2 victoria rd", phone: "022222222", occupancy: 10 , owner_id: 1)
Place.create(name: "Bontempo", location: "400 Bridge rd", phone: "0211111111", occupancy: 12 , owner_id: 1)
Place.create(name: "Mr Minhs", location: "305 victoria rd", phone: "0320000000", occupancy: 5 , owner_id: 1)


def place_params
    params.require(:place).permit(:name, :location, :phone, :occupancy, :owner_id)
end 