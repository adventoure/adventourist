#!/bin/bash

case "$1" in
"build")
  pub get
  dir=`pwd`
  cd $2
  export ADVENTOURIST_HOME=$dir
  dart $dir/bin/main.dart build
  ;;
"test")
  pub run test $2
  ;;
*)
  echo "Adventourist ./go script"
  echo "========================"
  echo ""
  echo "You can use the following commands:"
  echo "  ./go build [game-dir]     Runs an game"
  echo "  ./go test                 Runs all tests"
  echo "  ./go test [file]          Runs the specified test"
  echo "  ./go help                 print this message"
esac



