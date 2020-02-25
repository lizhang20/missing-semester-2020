#!/bin/bash

polo() {
    echo "Before I am in directory $(pwd)"
    cd $dir || exit
    echo "Now I am in directory $(pwd)"
}