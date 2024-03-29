#!/bin/bash
echo -e "\033[0;32mDeploying updates to Github...\033[0m"

# cd to src directory
cd ../coehhu.com.src

# clean
rm -rf public

# Build the project.
/e/web/hugo_0.59.1/hugo.exe

# cd to web directory
cd -

# cp Public to git
cp -av ../coehhu.com.src/public/* .

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"
#
# Push source and build repos.
git push origin master
# Come Back up to the Project Root
cd ..






