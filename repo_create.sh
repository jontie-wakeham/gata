# Make executable with chmod +x <<filename.sh>>

CURRENTDIR=${pwd}

# step 1: name of the remote repo. Enter a SINGLE WORD ..or...separate with hyphens
echo "What name do you want to give your remote repo?"
read REPO_NAME

echo "Enter a repo description: "
read DESCRIPTION


# step 2:  the local project folder path
echo "what is the absolute path to your local project directory this should include the repo name?"
read PROJECT_PATH

echo "What is your github username?"
read USERNAME

 # Check all variables have been filled
 if [[ -z $REPO_NAME || -z $DESCRIPTION || -z $PROJECT_PATH || -z $USERNAME ]]; then
   echo 'one or more variables are undefined'
   exit 1
 fi

 if [[ -z $GITHUB_ACCESS_TOKEN ]]; then
     echo "You need to setup your Github Access Token variable from the browser."
     echo "For instructions go to: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-fine-grained-personal-access-token"
     exit 1
fi

# step 3 : go to path
if [ ! -d "$PROJECT_PATH" ]; then
    mkdir "$PROJECT_PATH";
fi
cd "$PROJECT_PATH"


# step 4: initialise the repo locally, create blank README, add and commit
git init
#touch README.MD
echo "Initial repository setup using .sh script" >> README.MD
git add README.MD
git commit -m 'initial commit setup with repo_create.sh script'


# step 5 use github API to log the user in
curl -u "$USERNAME":"$GITHUB_ACCESS_TOKEN"  https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

#  step 6 add the remote github repo to local repo and push
git remote add origin git@github.com:${USERNAME}/${REPO_NAME}.git
git push --set-upstream origin master

# step 7 change to your project's root directory.
#cd "$PROJECT_PATH/$REPO_NAME"

echo "Done. Go to https://github.com/$USERNAME/$REPO_NAME to see."
echo " *** You're now in your project root. ***"
