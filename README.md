* Ruby version
	2.6.3

* Encryption
	Master key would be required to run the application which is attached with email.

* How to edit Encrypted file?
	Command to open file in sublime:   EDITOR="subl --wait" bin/rails credentials:edit

* Configuration
	Update database username/password by modifying encrypted variable "db_username"/"db_password".
	There is encrypted variable "notification_user" which is going to receive notification whenever there is any error while calling third party api. Current value is 'test@yopmail.com'

* Steps to run application
	Add file master.key in config/folder.
	run command: docker-compose build
	run command: docker-compose run web rake db:create db:migrate
	run command: docker-compose up

* How to run the test suite
	docker-compose run -e "RAILS_ENV=test" web rake db:create db:migrate
	docker-compose run -e "RAILS_ENV=test" web rake test
