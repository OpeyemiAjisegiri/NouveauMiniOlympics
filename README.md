== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.

#Ruby on Rails: Newer version of the JHDC MINI OLYMPICS WebApp

##Ruby Versio##
Ruby version	2.1.5-p273 (i386-mingw32)
RubyGems version	2.2.2
Rack version	1.5.5
Rails version	4.1.8
JavaScript Runtime	JScript
Active Record version	4.1.8
Action Pack version	4.1.8
Action View version	4.1.8
Action Mailer version	4.1.8
Active Support version	4.1.8

Environment	 development
Database adapter	mysql2



################Extra Info##
Due to the Javascript error similar to the questions on these two pages http://stackoverflow.com/questions/12520456/execjsruntimeerror-on-windows-trying-to-follow-rubytutorial/14118913#14118913, solution by @Kevin P and http://stackoverflow.com/questions/28421547/rails-execjsprogramerror-in-pageshome/28436913#28436913, Solution by @evedovelli. I dumbed down the gem coffee-script-source from the most current '1.9.1.1' to the older '1.8.0', by adding "gem 'coffee-script-source', '1.8.0'" to the gemfile; thereby using the solution on the second page and it worked.


## Restrict User index later in app/views/layouts/_header.html.erb, so that only logged in admin users (can see every user and which team they are registered with) and a fellow team member can see users on that team