# gAlert 🔔

`gAlert` ist ein interaktives CLI-Tool zur Suche, Vorschau und Installation von Sounds von **Freesound.org** als offizielle Linux-Systemsounds (Gnome, Cinnamon, XFCE).

---
<p align="center">
  <img src="https://derlinke.github.io/logo.svg" width="450" alt="gAlert Logo">
</p>

## 🚀 Kernfunktionen
- **Intelligente Suche**: Durchsucht die Freesound APIv2 gezielt nach hochwertigen Klängen.
- **Lizenz-Filter**: Berücksichtigt automatisch nur Sounds unter *Creative Commons 0* oder *Attribution* (CC-BY).
- **Direkt-Vorschau**: Audio-Wiedergabe direkt im Terminal vor der Installation.
- **System-Integration**: Erstellt ein standardkonformes Sound-Theme gemäß Freedesktop-Spezifikation unter `~/.local/share/sounds/gAlert/`.
- **Ereignis-Mapping**: Zuweisung von Sounds zu spezifischen System-Events (Klick, Fehler, Login, etc.).

## 📦 Installation

### Der schnellste Weg (APT Repository)
Da `gAlert` Teil des zentralen **DerLinke Repositories** ist, kannst du es einfach so installieren:

1. Repository hinzufügen (falls noch nicht geschehen):
   ```bash
   curl -s https://derlinke.github.io/derlinke-repo.gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/derlinke-repo.gpg > /dev/null
   echo "deb [signed-by=/usr/share/keyrings/derlinke-repo.gpg] https://derlinke.github.io/ stable main" | sudo tee /etc/apt/sources.list.d/derlinke.list
   ```

2. Installieren:
   ```bash
   sudo apt update
   sudo apt install galert
   ```

## 🛠 Funktionsweise & Abhängigkeiten

### Wie es funktioniert
1. **API**: Das Tool sendet Suchanfragen an Freesound.org.
2. **Download**: Gewählte Previews werden temporär nach `/tmp` geladen.
3. **Player**: Zur Wiedergabe nutzt `gAlert` eine Fallback-Kette (`paplay` -> `ogg123` -> `aplay`).
4. **Installation**: Das Tool erstellt eine Ordnerstruktur für ein Sound-Thema. Es kopiert die gewählten Sounds an die korrekten Stellen (z.B. `button-pressed.ogg`) und erstellt eine `index.theme` Datei, damit Linux das Thema erkennt.

### System-Abhängigkeiten
- **Python 3.x** & **python3-requests** (für die API-Kommunikation)
- **python3-rich** (für das Cyberpunk-Branding)
- **pulseaudio-utils** (empfohlen für `paplay`) oder **vorbis-tools** (`ogg123`)

## ⌨️ Benutzung

Suche nach einem Effekt:
```bash
galert --search "mechanical click"
```

**Interaktives Menü:**
- `[P]` - Vorschau anhören
- `[I]` - Sound installieren
- `[A]` - Zurück zur Liste / Abbrechen

Nach der Installation kannst du in deinen Desktop-Einstellungen (z.B. in Cinnamon unter "Klänge") das Thema **gAlert** auswählen.

## 🔑 API-Key
Standardmäßig ist ein Key hinterlegt. Eigene Keys können via `~/.config/galert/config.ini` definiert werden:
```ini
[API]
token = DEIN_TOKEN
```

## 📜 Lizenz
Dieses Projekt steht unter der [MIT-Lizenz](LICENSE).
EOF
