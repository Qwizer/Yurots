#!/bin/sh
terminal="${RCT_TERMINAL-${REACT_TERMINAL-$TERM_PROGRAM}}"

if [ -z "${RCT_NO_LAUNCH_PACKAGER+xxx}" ] && [ "$CONFIGURATION" == "Debug" ] ; then
  if nc -w 5 -z localhost 8081 ; then
    if ! curl -s "http://localhost:8081/status" | grep -q "packager-status:running" ; then
      echo "Port 8081 already in use, packager is either not running or not running correctly"
      exit 2
    fi
  elif [ -z "$terminal" ]; then
    open "$SRCROOT/../scripts/launchPackager.command" || echo "Can't start packager automatically"
  else
    open -a $terminal "$SRCROOT/../scripts/launchPackager.command" || echo "Can't start packager automatically"
  fi
fi

