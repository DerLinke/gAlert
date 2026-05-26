#!/bin/bash

# gAlert Installations-Skript

echo "Prüfe System-Abhängigkeiten..."

# Check for apt
if command -v apt-get >/dev/null; then
    echo "Installiere System-Abhängigkeiten via apt..."
    sudo apt-get update
    sudo apt-get install -y python3-requests python3-rich pulseaudio-utils vorbis-tools make
else
    echo "Paketmanager 'apt' nicht gefunden. Bitte installiere 'python3-requests', 'pulseaudio-utils' und 'vorbis-tools' manuell."
fi

# Install galert
echo "Installiere galert..."
if command -v make >/dev/null; then
    sudo make install
else
    echo "'make' nicht gefunden. Installiere manuell nach /usr/local/bin..."
    sudo install -m 755 galert /usr/local/bin/galert
fi

echo "Installation abgeschlossen. Du kannst nun 'galert --search <begriff>' verwenden."
