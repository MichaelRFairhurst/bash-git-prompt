PROMPTEXPORT='
if [ -e ~/.mikeprompt ]
then
	:
else
  mkdir ~/.mikeprompt
  echo -e '"$(printf %q "$(cat ~/.mikeprompt/common_rc.sh)")"' > ~/.mikeprompt/common_rc.sh
  echo -e '"$(printf %q "$(cat ~/.mikeprompt/gitprompt.sh)")"' > ~/.mikeprompt/gitprompt.sh
  echo -e '"$(printf %q "$(cat ~/.mikeprompt/gitstatus.py)")"' > ~/.mikeprompt/gitstatus.py
  echo -e '"$(printf %q "$(cat ~/.mikeprompt/promptexp.sh)")"' > ~/.mikeprompt/promptexp.sh
  echo -e '"$(printf %q "$(cat ~/.mikeprompt/promptbashrc)")"' > ~/.mikeprompt/promptbashrc
  chmod +x ~/.mikeprompt/promptexp.sh
fi
bash --rcfile $HOME/.mikeprompt/promptbashrc -i'

if [ "$1" = "ssh" ]
then
  shift
  ssh $@ -t "$PROMPTEXPORT"
fi

if [ "$1" = "su" ]
then
  shift
  su $@ -c "$PROMPTEXPORT"
fi
