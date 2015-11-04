#How to deploy siyento
  Firts of all you need to create user deploy with sudo rights.
  ```
  sudo adduser deploy
  sudo adduser deploy sudo
  ```
  Than run provision using chef. make git clone from bitbucket 
  ```
  git clone git@bitbucket.org:justbuk/chef-siyento.git
  ```
  after in repo folder run
  ```
  bundle install
  ```
  when bundle is complete you need to start provision tool
  
  ```
  chef solo bootstrap deploy@ip_address
  ```
  Afther all go successfully go to the server via ssh under user deploy. and create database.yml and secrets.yml in folder /home/apps/siyento/shared/config/ get database login and password from chef-siyento/nodes/ json file with server and put it in database.yml. secrets.yml should contains mailchimp api key. Fetch siyento repository
  ```
  git clone git@github.com:justbdigital/siyento.git
  ```
  in siyento root folder run
  ```
  cap production deploy
  ```
  than go to server via ssh under user deploy and run
  ```
  sudo service unicorn_siyento start
  ```
  
  than run
  ```
  gem isntall whenever
  ```
  go to the folder /home/apps/siyento/current and run
  
  ```
  whenever -w
  ```
  after an hour data will be pasrsed in database (task goes one time per hour)
  Thats all process for typically deploy.
