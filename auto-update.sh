#!/bin/sh

cd /config
touch pidFiles/"$$"
echo "Aggiunto file pid: $$"
GIT_CHECK=$(command -v git)
if [ -z "$GIT_CHECK" ]; then
  echo "Git non presente. Installo..."
  apk add git
fi
git add auto-update.sh LICENSE.md automations.yaml configuration.yaml groups.yaml scenes.yaml scripts.yaml ui-lovelace.yaml
echo "Controllo file modificati"
GIT_STATUS=$(git status --untracked-files=no --porcelain)
if [ -z "$GIT_STATUS" ]; then
  echo "Nessuna modifica"
else
  echo "File modificati"
  git commit -m `date +%d/%m/%Y`
  echo "Nuovo commit"
fi
git push origin master
rm pidFiles/"$$"
echo "Rimosso file pid. Fine script"
