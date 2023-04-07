#!/bin/bash
# set git clean command with necessary flags
# -f to force delete files (git won't remove them by default)
# -d to recursively check directories in repo and not just the level the command was run
# -n to perform a dry-run first, meaning it will identify files but not remove them
TO_REMOVE=`git clean -f -d -n`;
TO_REMOVE=`git clean -f -d -n`;
# if the command's execution doesn't return `null`
if [[ -n "$TO_REMOVE" ]]; then
  echo "Cleaning...";
  # use printf to execute the expression that `TO_REMOVE` variable holds
  printf "\n$TO_REMOVE\n\n";
  echo "Proceed?"
else
  echo "Everything is clean";
fi;
# The `git clean -f -d -n` command will return a list of files that will be removed if we run `git clean -f -d`. We store this list in the variable `TO_REMOVE` using the backticks ``.
  # use `select` command to prompt a list of options to be displayed for picking and store in `result` 
select result in Yes No; do
  # if we say "yes" in the prompt...
  if [[ "$result" == "Yes" ]]; then
    echo "Cleaning in progress...";
    echo "";
    # execute `git clean -f -d`
    git clean -f -d;
    echo "";
    echo "All files and directories removed!";
  fi
  break;
done;


#With this `if` statement, we use a set of double square brackets `[[ <condition> ]]` to ensure that any white spaces in the string output by the execution of `TO_REMOVE` aren't read as separate arguments. To access a variable, we use the dollar sign `$`. 


