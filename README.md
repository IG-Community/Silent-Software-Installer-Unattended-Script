English:

**Silent Software Installer | Unattended Script**

Version: 3.5.0

**Description:**
The Silent Software Installer is an unattended script that automates the installation of several software applications. It provides a menu-driven interface that allows you to choose which software to install without any user interaction. The script supports the installation of the following software:

1. Mozilla Firefox
2. Google Chrome
3. Mozilla Thunderbird
4. VLC Media Player
5. Adobe Acrobat Reader DC
6. Oracle Java Runtime Environment (optional)

The script checks if each software is already installed on the system and skips the installation if it is detected. Otherwise, it looks for the installation files in the specified directory and installs the software
silently.

**Usage:***
1. Run the script in a PowerShell environment.
2. The script will display a menu with options for different installation configurations.
3. Select the desired option by entering the corresponding number.
4. The script will install the selected software silently without any further user interaction.
5. Once the installation process is completed, a confirmation message will be displayed.

**Menu Options:**
1. Unattended Install without Java: Installs all software except Java.
2. Unattended Install without Java and Thunderbird: Installs all software except Java and Thunderbird.
3. Unattended Install with Java: Installs all software including Java.
4. Unattended Install with Java but without Thunderbird: Installs all software including Java, but excludes Thunderbird.
0. Quit: Exits the script.

**Notes:**
- The script assumes that the installation files for each software are located in the specified directory (`.\Setups\`).
- If an installation file is not found, an error message will be displayed.
- The script checks if each software is already installed using the registry information.

**Disclaimer:**
This script is provided as-is and without warranty. Please ensure that you have the necessary legal rights and permissions to install the software applications using this script.

**Version History:**
- Version 3.5.0: Updated menu options.
- Version 3.0.0: Code overhaul with new features: software installation check and file recognition 
- Version 2.0.0: Added menu option and support for Oracle Java Runtime Environment 
- Version 1.0.0: First Release with support for Firefox, Chrome, Thunderbird, VLC, and Adobe Reader DC installations.

For any questions or support, please contact the script author.



Deutsch:

Version: 3.5.0

**Beschreibung:**
Der Silent Software Installer ist ein unbeaufsich􀆟gtes Skript, das die Installation verschiedener So􀅌wareanwendungen
automa􀆟siert.
Es bietet eine menügesteuerte Oberfläche, die es Ihnen ermöglicht, die zu installierende So􀅌ware ohne jegliche
Benutzerinteraktion auszuwählen.
Das Skript unterstützt die Installa􀆟on der folgenden So􀅌ware:

1. Mozilla Firefox
2. Google Chrome
3. Mozilla Thunderbird
4. VLC-Media Player
5. Adobe Acrobat Reader DC
6. Oracle Java Runtime Environment (optional)
7. 
Das Skript prüft, ob die jeweilige So􀅌ware bereits auf dem System installiert ist, und überspringt die Installation, wenn sie erkannt wird.
Andernfalls sucht es im angegebenen Verzeichnis nach den Installa􀆟onsdateien und installiert die So􀅌ware unbemerkt.

**Verwendung:**
1. Führen Sie die Silent_installer.exe aus.
2. Das Skript zeigt ein Menü mit Op􀆟onen für verschiedene Installa􀆟onskonfigura􀆟onen an.
3. Wählen Sie die gewünschte Op􀆟on aus, indem Sie die entsprechende Nummer eingeben.
4. Das Skript installiert die ausgewählte So􀅌ware im Hintergrund, ohne dass der Benutzer eingreifen muss.
5. Sobald der Installa􀆟onsvorgang abgeschlossen ist, wird eine Bestä􀆟gungsmeldung angezeigt.

**Menü Optionen:**
1. Unbeaufsichtigte Installation ohne Java.
2. Unbeaufsichtigte Installation ohne Java und Thunderbird.
3. Unbeaufsichtigte Installation mit Java.
4. Unbeaufsichtigte Installation mit Java, aber ohne Thunderbird.
0. Beenden: Beendet das Skript.

**Hinweise:**
- Das Skript geht davon aus, dass sich die Installationsdateien für jede So􀅌ware im angegebenen Verzeichnis (`.\Setups\`) befinden.
- Wenn eine Installationsdatei nicht gefunden wird, wird eine Fehlermeldung angezeigt.
- Das Skript prüft anhand der Registrierungsinformationen, ob die jeweilige So􀅌ware bereits installiert ist."

**Versionsgeschichte:**
- Version 3.5.0: Aktualisierte Menüop􀆟onen.
- Version 3.0.0: Code-Überarbeitung mit neuen Funk􀆟onen: Software-Installationsprüfung und Dateierkennung
- Version 2.0.0: Menüoption und Unterstützung für Oracle Java Run􀆟me Environment hinzugefügt
- Version 1.0.0: Erste Veröffentlichung mit Unterstützung für Firefox, Chrome, Thunderbird, VLC und Adobe Reader DC Installationen.

Bei Fragen oder Support wenden Sie sich bite an den Skriptautor.

