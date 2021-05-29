#!/usr/bin/env bash
echo "END";

# Its Necesary if you want use this NODE for create the project
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

### ------------------------------------------------------------------------------###
## If "ng serve" command is not working use "ng serve --port 4200 --host 0.0.0.0" ##
### ------------------------------------------------------------------------------###

touch test
tail -0f test