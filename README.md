# README - Friends Chat

# Requirement
  - PostgreSQL
  - Rails v. 7.0.4.3
  - Ruby v. 3.1.2

# Install Gem / Libraries
  - run ```bundle install```

# Set the ENV Variable
  - Create ```.env``` file in the root
  - Set value to variables ```HOST_DB, USERNAME_DB, PASSWORD_DB and PORT_DB```

# Database Build
  - run ```rake db:create```
  - run ```rake db:migrate```
  - run ```rake db:seed```

# Run Unit Test
  - run ```bundle exec rspec```
