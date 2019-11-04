# Production Link

[Parking Garage](https://also-parking-garage.herokuapp.com/)

# Introduction

This app is intended to simulate a multi-level parking structure. Each level has several parking spots which come in three sizes: motorcycle, compact, or large.

Motorcycles can park in any type of spot. Cars can park in compact or large spots. A bus can park in five consecutive large spots.

# Database Models

A Structure has three dimensions: height (number of floors), width (number of rows per floor), and length (determines the number of spots that will fit in each row). In the relational database, a Structure has many Floors. Each Structure also has a unique name.

A Floor has two dimensions: width and length. In the database, a Floor has many Rows and belongs to a Structure.

A Row has one dimension: length. In the database, a Row has many Spots and belongs to a Floor. Each row has a unique letter identifying its position on its floor.

A Spot has one of the following widths: 2 for motorcycle, 3 for compact, 4 for large. In the database, a Spot belongs to a Vehicle (nil if not currently occupied). Each spot has a unique number identifying its position in its row.

A Vehicle occupies one of the following widths: 2 for motorcycle, 3 for car, 20 for bus. In the database, a Vehicle has one spot if it is a motorcycle or a car, and has many spots (5) if it is a bus.

A Structure can track the total fare it receives from motorcycles, cars, and buses. The owner can use this information to determine whether they should redistribute the number of parking spots allocated for each type of vehicle.

# Setup

Gemfile dependencies `bundle install`

Setup database
`rails db:{create,migrate}`

Run server `rails s`

# Testing

Run tests with
`rspec`

# Tech Stack

* Ruby v2.4.1
* Rails v5.2.3
* PostgreSQL v11.5
* RSpec testing suite

# Future Iterations

Allow admin users to track revenue day-to-day.

Allow admin users to reallocate parking spots. For example, they may want to add more compact spots in place of large spots if revenue trends indicate that would increase overall revenue.

Allow visitors to select the spot(s) they would like to reserve.

Implement parking rates on hourly, daily, and monthly basis.

# Core Contributors

[Jake Miller](https://github.com/Jake0Miller)
