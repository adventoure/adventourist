#!/bin/bash

case "$1" in
"run")
  pub get
  pub run bin/main.dart
  ;;
"test")
  pub run test $2
  ;;
*)
  echo "Adventourist ./go script"
  echo "========================"
  echo ""
  echo "You can use the following commands:"
  echo "  ./go run          Runs the app"
  echo "  ./go test         Runs all tests"
  echo "  ./go test [file]  Runs the specified test"
  echo "  ./go help         print this message"
esac



