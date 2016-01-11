buildFlask() {
  # Build the directories
  echo 'Creating directory structure'
  mkdir -p app/{static/{img,css,js,font},templates}

  # install flask
  echo 'Installing flask to your enviroment'
  pip install flask
  pip freeze > requirements.txt

  # Create a run file and config files
  echo 'Creating a config file, and a debug run script'
  echo "from app import app\n\n\napp.run(host='0.0.0.0')" > run.py
  touch config.py

  # And a basic init file for 
  echo 'Building a basic app'
  echo "from flask import Flask\n\napp = Flask(__name__)\napp.config.from_object('config')\n\n# a basic view just to affirm we are live\n@app.route('/')\ndef index():\n\treturn 'Hello World'" > app/__init__.py
}
checkDirectories() {
  # Checks out the directory to prevent the smashy, this well exit code 1 if it detects anything wrong
  VIRTUAL_DIR=$(basename $PWD)
  VIRTUAL_ENV=$(basename $VIRTUAL_ENV)
  WORKING_DIR=$(pwd)

  # Check if we are in the correct dir
  if [ "$VIRTUAL_DIR" = "$VIRTUAL_ENV" ];
  then
    echo 'Virtual Enviroment directory detected...'
  else
    echo 'Error: Please assure you are in the virtual enviroment directory before attempting to bootstrap flask'
    exit 1
  fi

  # Now we must check if a flask project already exists
  # There are a lot of components to test here, leggo
  if [ -f $WORKING_DIR/run.py ];
  then
    echo 'Error: Flask project already found, aborting bootstraper'
    exit 1
  fi
  
  if [ -f $WORKING_DIR/config.py ];
  then
    echo 'Error: Flask project already found, aborting bootstraper'
    exit 1
  fi
  
  if [ -f $WORKING_DIR/requirements.txt ];
  then
    echo 'Error: Flask project already found, aborting bootstraper'
    exit 1
  fi
  
  if [ -f $WORKING_DIR/app/__init__.py ];
  then
    echo 'Error: Flask project already found, aborting bootstraper'
    exit 1
  fi
  echo 'Directory is clean, proceeding to build flask app'
}

forcestrap() {
  echo 'Forcing a build in your current directory'
  buildFlask
}

bootstrap() {
  if [ -z $VIRTUAL_ENV ];
  then
    echo 'Please workon a virtual enviroment before bootstraping a flask project'
    exit 1
  else
    echo 'Checking the directory structure to make sure we do no smashing'
    checkDirectories
    buildFlask
  fi
  echo 'Flask bootstrapping was successful!'
}

help () {
  echo 'Flaskify bootstraps a flask app into your current directory.'
  echo 'This will hopefully stop you from forgetting how to make flask apps.'
  echo 'Dont say you dont I know you forget and go look at your last project everytime'
  echo

  echo 'Usage:'
  echo '\tflaskify [options]'
  echo

  echo 'Options:'
  echo '\t-h, --help\t\t\tShows the help prompt'
  echo '\t-f, --force\t\t\tForces a build in your current directory potentiall smashing all the bits'
}

# check for arguments and take action accordingly
if [ $# -gt 0 ];
then
  if [ $1 = '-f' ];
  then
    forcestrap
  elif [ $1 = '--force' ];
  then
    forcestrap
  else
    help
    exit 0
  fi
else
  bootstrap
fi 

echo 'Goodbye :)'
