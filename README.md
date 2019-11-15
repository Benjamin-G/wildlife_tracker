# Wildlife Tracker

## Installation Steps
### Initial -this is for future reference
```sh
    rails new wildlife_tracker -d postgresql -t
    cd wildlife_tracker
    rails db:create
    bundle add rspec-rails
    rails g rpsec:install
    rails g rspec:request animal_crud
    rails g resource animal common_name:string latin_name:string kingdom:string
    rails db:migrate
    rails g resource animal_sighting date:datetime lat:float long:float
    rails db:migrate
    gem install factory_bot_rails //changed gemfile
    rails g rspec:request animal_sighting_api
    rails g migration add_relationship_animal_animal_sighting
```
