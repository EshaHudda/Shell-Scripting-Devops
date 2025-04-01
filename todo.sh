#!/bin/bash

TODO_FILE="todo.txt"

while true; do
  echo "To-Do List Menu:"
  echo "1. Add a task"
  echo "2. View tasks"
  echo "3. Remove a task"
  echo "4. Exit"

  read -p "Enter your choice: " choice

  case $choice in
    1)
      read -p "Enter the task: " task
      echo "$task" >> "$TODO_FILE"
      echo "Task added."
      ;;
    2)
      if [ -s "$TODO_FILE" ]; then
        cat "$TODO_FILE"
      else
        echo "No tasks found."
      fi
      ;;
    3)
      if [ -s "$TODO_FILE" ]; then
    cat -n "$TODO_FILE"
    read -p "Enter the line number to remove: " line_num
    if [ -f "$TODO_FILE" ]; then
      sed -i"" "${line_num}d" "$TODO_FILE"  # Corrected sed command
      echo "Task removed."
    else
      echo "No tasks found."
    fi
  else
    echo "No tasks found."
  fi
  ;;
    4)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid choice."
      ;;
  esac
done