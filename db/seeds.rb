# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


require 'factory_bot_rails'
require 'faker'
include FactoryBot::Syntax::Methods

create_list :tenant, 5

create_list :question, 4, private: false
create_list :question, 2, private: true

u = create :user
q = create :question, private: false

create_list :answer, 2, question: q, user: u

