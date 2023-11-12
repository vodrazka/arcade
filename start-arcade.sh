#!/bin/bash

reset
clear
docker run --name arcade -it --rm -p 1234:22 vodrazka/thomas.arcade
