# Dev Bootcamp Overflow
As a two-day group project, my team and I built a Sinatra application from the ground-up that mirrored the popular developer community - Stack Overflow. The goals of this project was to practice agile workflow, and to include a good mix of frontend and backend features. Our team paid specific attention to defining clear routes, creating clean templates, and enhancing the user experience with AJAX.

### Getting Started
These instructions will give you a copy of this project running on your local machine.

### Prerequisites
Ensure that PostgreSql is available on an OS X machine. Here’s how you can get that working:
Step 1: Install Homebrew
brew update
Step 2: Install Homebrew’s Services Tool
brew tap homebrew/services
Step 3: Use Homebrew to Install PostgreSQL Natively
brew install postgresql
Step 4: Register PostgreSQL as a Service
brew services start postgresql

### Deployment
Clone this clone to your machine, then run the following commands to get it up and running.
* Bundle install
* Bundle exec rake db:create
* Bundle exec rake db:migrate
* Bundle exec rake db:seed
* Bundle exec shotgun

Copy the localhost route into your browser and everything should be smooth sailing. If the bundle install fails, your first attempt should be to delete the file Gemfile.lock and run bundle install again.

Built With:
* Sinatra
* Ruby
* Javascript

Additional Resources
 * Readme Source - https://gist.github.com/PurpleBooth/109311bb0361f32d87a2#file-readme-template-md
