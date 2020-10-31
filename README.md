# Rasa NLU server template

This template contains all you need to deploy [Rasa NLU](https://rasa.com/) server on [Heroku cloud](https://heroku.com) to make your Rasa project visible globally.

## How to use

Click on the button below to deploy this template on your Heroku instance.
Heroku will automatically build the Docker image and your project's NLU model.

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

_It takes a couple of minutes to build and start the server. You can see the progress in Heroku logs._

## How to make requests

Once your server is deployed, you can make requests to your NLU model via [Rasa HTTP API](https://rasa.com/docs/rasa/api/http-api/#operation/parseModelMessage)
For example:

`curl https://<your Heroku application name>.herokuapp.com/model/parse -d '{"text":"hello"}'`

## How to change the model

Once you've deployed and tested your NLU server, you can then clone it to your machine and make changes in NLU model.

### 1. Clone the application

Install [git](https://git-scm.com/downloads) and [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install).
Run a terminal (or console) on your machine and type

```
heroku login
heroku git:clone -a <your Heroku application name>
cd <your Heroku application name>
git remote add origin https://github.com/just-ai/rasa-heroku-template
git pull origin master
```

_You have to do these steps only once per project._

### 2. Make changes

#### Install Rasa

Install Rasa on your machine. Here is a great [installation guide](https://rasa.com/docs/rasa/user-guide/installation/).

#### Train NLU model

Then go to the directory of your application (cloned on the previous step) and make some changes in the model.
Please refer to the [Rasa documentaion](https://rasa.com/docs/rasa/user-guide/rasa-tutorial/) to learn how to build and evaluate NLU model.

> Please note that you don't have to run **rasa init** command once your template project is already cloned from Heroku.
Also note that NLU server doesn't run any actions - it only runs your NLU model. Thus you can use only **rasa train nlu** command.

#### Evaluate changes

To evaluate your changes on your local machine just run NLU server locally and make some HTTP requests to the [Rasa HTTP API endpoint](https://rasa.com/docs/rasa/http-api).
You can also use [shell command](https://rasa.com/docs/rasa/command-line-interface#rasa-shell) to try your mddel without running a server.

#### Push changes to Heroku

Once you've trained and evaluated your NLU model, you can push changes to Heroku.

Run the next commands in the terminal

```
git add .
git commit -am "some comments"
git push
```

Heroku will automatically handle the changes, re-build NLU model and re-start the server.

> Please note that locally trained NLU models won't be pushed to the Heroku repository.
