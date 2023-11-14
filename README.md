# Rails-API

This project was not concluded and discontinued. 

This is an API that validates users so they are able to login to a front end in another [codebase](https://github.com/francomoraes/portfolio-games) made with a React.  

## Getting started

To get the repository locally, execute the following command in the terminal.
```
git clone https://github.com/gutoarraes/rails-api
```
Install all gems:
```
gem install
```
Start the API server by running `rails s`

# test

On a web tool for API building such as [postman](https://www.postman.com/) you can test that the server is running correctly by creating an instance of a user in the rails console, and issuing the following `GET` request:

*

### Greatest challenge

The biggest challenge was editing the `secrets.enc.yml` file. I wasn't able to find a work around in my Windows OS, so I eventually used a VM, installed MacOS and managed to edit the file. 

This gave me the opportunity to manage `rails` versions, configuraing environment variables, and following through on error messages, all on an operating system (OS) that I had very limited experience on.  

## Technologies

* Database: PostgreSQL
* Hosting:  Fly.io
* Backend:  Ruby on Rails

### Acknowledgements

Huge shoutout to my friend [Franco Moraes](https://github.com/francomoraes) who gave me the idea and the opportunity to start this project and piggyback off of his React [application](https://github.com/francomoraes/portfolio-games).
