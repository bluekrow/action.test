#!/bin/sh -le

echo "ENVIRONMENT VARIABLES"
echo "Token:$INPUT_TOKEN"
echo "RepoName: $INPUT_REPO_NAME"
echo "OwnerName: $INPUT_OWNER_NAME"
echo "OwnerEMail: $INPUT_OWNER_EMAIL"
echo "CommitMessage: $INPUT_COMMIT_MESSAGE"
echo "DeployBranch: $INPUT_DEPLOY_BRANCH"
echo "DeployDir: $INPUT_DEPLOY_DIR"
echo "SourceDir: $INPUT_SOURCE_DIR"
echo ""

echo "CALCULATED VARIABLES"
REPO_URL=https://github.com/${INPUT_OWNER_NAME}/${INPUT_REPO_NAME}.git
echo "RepoUrl: $REPO_URL"
REPO_URL_AUTH=https://${INPUT_OWNER_NAME}:${INPUT_TOKEN}@github.com/${INPUT_OWNER_NAME}/${INPUT_REPO_NAME}.git
echo "RepoUrlAuth: $REPO_URL_AUTH"
DEPLOY_BRANCH_EXISTS=$(git ls-remote --heads ${REPO_URL} ${INPUT_DEPLOY_BRANCH} | wc -l)
echo "DeployUrlExists: $DEPLOY_BRANCH_EXISTS"
echo ""

pwd
ls -lha

sh /scripts/01.setup.sh
sh /scripts/02.generate.sh
sh /scripts/03.configure.local.sh
sh /scripts/04.deploy.sh

echo "DEPLOY FINALIZED"