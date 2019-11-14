# Wildlife Tracker

## Installation Steps
# Initial -this is for future reference
```sh
    rails new wildlife_tracker -d postgresql -t
    cd wildlife_tracker
    rails db:create
    bundle add rspec-rails
    rails g rpsec:install
    rails g rspec:request animal_crud
    rails g resource animal common_name:string latin_name:string kingdom:string
    rails db:migrate
```
#
