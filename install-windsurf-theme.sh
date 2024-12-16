#!/bin/bash

echo "⚠️  WARNING: This installation script is experimental and has not been tested yet."
echo "⚠️  Use at your own risk. Make sure to backup any existing theme configurations."
echo "⚠️  Press Ctrl+C to cancel or Enter to continue..."
read

# Configuration
THEME_NAME="ismar-oled-theme"
THEME_DISPLAY_NAME="IsmOLED Theme"
THEME_VERSION="1.0.0"
PUBLISHER="ismar"
EXTENSION_DIR="$HOME/.windsurf/extensions/$PUBLISHER.$THEME_NAME-$THEME_VERSION"

# Create extension directory structure
mkdir -p "$EXTENSION_DIR/themes"

# Copy theme file
cp ismar-theme.json "$EXTENSION_DIR/themes/"

# Create package.json
cat > "$EXTENSION_DIR/package.json" << EOL
{
    "name": "${THEME_NAME}",
    "displayName": "${THEME_DISPLAY_NAME}",
    "version": "${THEME_VERSION}",
    "publisher": "${PUBLISHER}",
    "engines": {
        "windsurf": "*"
    },
    "contributes": {
        "themes": [
            {
                "label": "IsmOLED",
                "uiTheme": "vs-dark",
                "path": "./themes/ismar-theme.json"
            }
        ]
    }
}
EOL

# Make script executable
chmod +x "$EXTENSION_DIR/package.json"

echo "Theme installed successfully!"
echo "Location: $EXTENSION_DIR"
echo "Restart Windsurf to apply the theme."
echo "Then select the theme: View -> Theme -> IsmOLED"
