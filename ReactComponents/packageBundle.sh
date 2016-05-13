#!/bin/zsh

# Define NVM_DIR and source the nvm.sh setup script
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"

if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  . "$HOME/.nvm/nvm.sh"
elif [[ -x "$(command -v brew)" && -s "$(brew --prefix nvm)/nvm.sh" ]]; then
    . "$(brew --prefix nvm)/nvm.sh"
fi

# Set up the nodenv node version manager if present
if [[ -x "$HOME/.nodenv/bin/nodenv" ]]; then
    eval "$($HOME/.nodenv/bin/nodenv init -)"
fi

[ -z "$NODE_BINARY" ] && export NODE_BINARY="node"

REACT_COMPONENTS=${SRCROOT}/ReactComponents
REACT_NATIVE_MODULE=${REACT_COMPONENTS}/node_modules/react-native
BUNDLE_SCRIPT=${REACT_NATIVE_MODULE}/local-cli/cli.js
ENTRY_FILE=${REACT_COMPONENTS}/src/index.ios.js
ASSETS_DEST=$CONFIGURATION_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH
JSBUNDLE_OUTPUT=${ASSETS_DEST}/main.jsbundle

#echo "...."${REACT_COMPONENTS}
#echo "...."${REACT_NATIVE_MODULE}
#echo "...."${BUNDLE_SCRIPT}
#echo "...."${ENTRY_FILE}
#echo "...."${ASSETS_DEST}
#echo "...."${JSBUNDLE_OUTPUT}
#cat ${ENTRY_FILE}
${NODE_BINARY} ${BUNDLE_SCRIPT} bundle \
        --entry-file "${ENTRY_FILE}" \
        --platform ios \
        --dev false \
        --bundle-output "${JSBUNDLE_OUTPUT}" \
        --assets-dest "${ASSETS_DEST}"
