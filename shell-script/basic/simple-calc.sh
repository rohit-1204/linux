#!/bin/bash

echo "Enter first number:"
read a

echo "Enter operator (+ - * /):"
read op

echo "Enter second number:"
read b

case $op in
    +) echo "Result = $((a + b))" ;;
    -) echo "Result = $((a - b))" ;;
    \*) echo "Result = $((a * b))" ;;
    /) echo "Result = $((a / b))" ;;
    *) echo "Invalid operator" ;;
esac