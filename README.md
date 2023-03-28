# README - Friends Chat

# Requirement
  - PostgreSQL
  - Rails v. 7.0.4.3
  - Ruby v. 3.1.2

# Install Gem / Libraries
  - run ```bundle install```

# Set the ENV Variable
  - Create ```.env``` file in the root
  - Set value to variables ```HOST_DB, USERNAME_DB, PASSWORD_DB, PORT_DB, RAPID_API_HOST and RAPID_API_KEY```

# Database Build
  - run ```rake db:create```
  - run ```rake db:migrate```
  - run ```rake db:seed```

# Initialize Data
  - run ```bundle exec rake indices_stock:generate```
  - run ```bundle exec rake identifier_stock:generate```

# Run Unit Test
  - run ```bundle exec rspec```
