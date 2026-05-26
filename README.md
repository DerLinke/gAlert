# gAlert

`gAlert` ist ein Open-Source CLI-Tool zur Suche, Vorschau und Installation von Sounds von Freesound.org als Linux-Systemsounds (Gnome/Cinnamon).

## Features
- Durchsucht Freesound.org APIv2 nach CC0/CC-BY lizenzierten Sounds.
- Audio-Vorschau direkt im Terminal (benötigt `paplay`, `ogg123` oder `aplay`).
- Automatische Installation als Sound-Theme gemäß Freedesktop-Spezifikation (`~/.local/share/sounds/gAlert/`).
- Modulare Architektur für einfache Erweiterbarkeit.

## Installation

### Voraussetzungen
- Python 3.x
- `requests` Bibliothek
- `paplay` (PulseAudio/PipeWire) oder `ogg123` (vorbis-tools)

### Schnell-Installation
Klone das Repository und führe das Installationsskript aus:

```bash
git clone https://github.com/DerLinke/gAlert.git
cd gAlert
chmod +x install.sh
./install.sh
```

## Benutzung

Suche nach einem Sound:
```bash
galert --search "click"
```

Folge den interaktiven Anweisungen im Terminal:
1. Wähle einen Sound aus der Ergebnisliste.
2. Drücke `[P]` für eine Vorschau.
3. Drücke `[I]` zur Installation als Systemsound (z.B. Button-Klick, Fehlermeldung).

## API-Key Konfiguration

Standardmäßig nutzt `gAlert` einen integrierten API-Key. Wenn du deinen eigenen Key verwenden möchtest, kannst du diesen auf zwei Arten konfigurieren:

1. **Umgebungsvariable**:
   ```bash
   export GALERT_API_KEY="DEIN_TOKEN"
   ```

2. **Konfigurationsdatei**:
   Erstelle die Datei `~/.config/galert/config.ini`:
   ```ini
   [API]
   token = DEIN_TOKEN
   ```

## Lizenz
Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).

---
<p align="center">
  <img src="logo.svg" width="450" alt="gAlert Logo">
</p>
