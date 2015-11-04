#How to deploy siyento
  Firts of all you need to create user deploy with sudo rights.
  ```
  sudo adduser deploy
  sudo adduser deploy sudo
  ```
  Than run provision using chef. make git clone from bitbucket 
  ```
  git clone git@bitbucket.org:justbuk/chef-siyento.git .
  ```
  after in repo folder run
  ```
  bundle install
  ```
  when bundle is complete you need to start provision tool
  
  ```
  chef solo bootstrap deploy@ip_address
  ```
  
