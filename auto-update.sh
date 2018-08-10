#!/bin/sh

cd /config
touch pidFiles/"$$"
echo "Aggiunto file pid: $$"
git add auto-update.sh LICENSE automations.yaml configuration.yaml customize.yaml groups.yaml scripts.yaml
echo "Controllo file modificati"
STATUS=$(git status --untracked-files=no --porcelain)
if [ -z "$STATUS" ]; then
  echo "Nessuna modifica"
else
  echo "File modificati"
  git commit -m `date +%x`
  echo "Nuovo commit"
  git push origin master
  echo "Upload eseguito"
fi
rm pidFiles/"$$"
echo "Rimosso file pid. Fine script"
