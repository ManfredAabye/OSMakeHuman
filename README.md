# MakeHuman

Dies ist der Hauptquellcode der MakeHuman-Anwendung. Siehe „Erste Schritte“ unten, um Anweisungen zu erhalten, wie Sie MakeHuman einrichten und starten können. Mac-Benutzer *sollten* die gleichen Anweisungen wie Windows-Benutzer verwenden können, auch wenn dies nicht umfassend getestet wurde.

## Aktueller Status

Zum Zeitpunkt der Erstellung dieses Dokuments ist der Quellcode fast bereit für eine stabile Veröffentlichung.

## Supportanfragen

Wenn Sie Fragen zur Software und ihrer Verwendung haben, stellen Sie bitte eine Anfrage in unserem Forum: http://www.makehumancommunity.org/forum.

Ein kurzer Blick auf zumindest die wichtigsten Fragen in den FAQ könnte ebenfalls sinnvoll sein: http://www.makehumancommunity.org/wiki/FAQ:Index

Bitte verwenden Sie den Issue-Tracker nicht für allgemeinen technischen Support. Für solche Fragen nutzen Sie bitte die Foren.

## Testen und Fehler melden

Das Ziel dieser Testphase ist es, eine Community-Version zu erstellen, die die Hauptanwendung sowie häufig genutzte, von Benutzern beigesteuerte Plugins umfasst. Wir hoffen, dass der Nutzen dieser integrierten Funktionen ausreicht, um eine größere Gruppe von Testern anzuziehen, die im Austausch für den Mehrwert bereit sind, mögliche Schwachstellen in der Anwendung zu entdecken.

Wenn Sie einen Fehler finden, melden Sie ihn bitte im Issues-Bereich hier auf GitHub. Um einen guten Fehlerbericht zu erstellen, fügen Sie bitte auch die Protokolle bei: http://www.makehumancommunity.org/wiki/FAQ:How\_to\_provide\_a\_makehuman\_log\_for\_a\_good\_bug\_report%3F

## Erste Schritte

Builds für Windows-Plattformen können von http://www.makehumancommunity.org/content/downloads.html heruntergeladen werden.

Falls Sie den Code lieber aus den Quellen ausführen möchten:

* Installieren Sie Python 3.6.x oder höher von https://www.python.org/ (oder über das Paketmanagement Ihres Systems). Unter Windows **MÜSSEN** Sie 64-Bit-Python verwenden. 32-Bit-Python funktioniert nicht.
* Installieren Sie die Python-Abhängigkeiten (siehe Abschnitt [Python-Abhängigkeiten installieren](#installing-python-dependencies) unten).
* Installieren Sie [Git](https://git-scm.com/) mit [LFS-Unterstützung](https://git-lfs.github.com/). Moderne Git-Clients haben LFS-Unterstützung standardmäßig integriert.
* Stellen Sie sicher, dass der Befehl „git“ über die PATH-Variable verfügbar ist.
* Klonen Sie das Repository https://github.com/makehumancommunity/makehuman.git mit Git (oder laden Sie den Quellcode als ZIP-Datei herunter).
* Führen Sie das Skript „download\_assets\_git.py“ im Unterverzeichnis „makehuman“ des Quellcodes aus.
* Optional können Sie auch folgende Skripte ausführen:
  * compile\_models.py
  * compile\_proxies.py
  * compile\_targets.py

### Python-Abhängigkeiten installieren

MakeHuman benötigt die folgenden Python-Pakete:

* numpy
* PyQt5
* PyOpenGL

Zusätzlich kann das Shell-Plugin von MakeHuman [IPython / Jupyter](https://jupyter.org/) verwenden. Sie können diese Pakete ebenfalls installieren:

* jupyterlab
* qtconsole

#### Python-Kernabhängigkeiten unter Linux installieren

Es wird empfohlen, die oben genannten Pakete über den Paketmanager des Betriebssystems zu installieren.

* __Debian / Ubuntu / Mint:__

  `apt install python3-opengl python3-pyqt5 python3-pyqt5.qtopengl python3-pyqt5.qtsvg`

* __openSUSE:__

  `zypper install python3-numpy python3-qt5 python3-opengl`

Eine alternative Methode zum Installieren von Abhängigkeiten ist die Verwendung von __pip__. Es ist jedoch best practice, eine [virtuelle Umgebung](https://docs.python.org/3/library/venv.html) einzurichten und zu aktivieren, bevor der Paketmanager von Python auf einem Linux-System verwendet wird. Zur Vereinfachung können Sie den folgenden Befehl ausführen:

  `pip install -r requirements.txt`

#### Python-Kernabhängigkeiten unter Windows installieren

Sie sollten den Befehl „pip“ starten können, indem Sie eine Eingabeaufforderung öffnen („Ausführen“ -> „cmd.exe“) und „pip“ eingeben. Falls nicht, finden Sie heraus, wie Sie [__pip__](https://pip.pypa.io/en/stable/) ausführen (es sollte automatisch mit Python installiert worden sein):

Verwenden Sie __pip__, um Abhängigkeiten zu installieren. Der folgende Befehl installiert alle Python-Abhängigkeiten:

`pip install -r requirements.txt`

### Plugins installieren

Wenn Sie Community-Plugins wie den Asset-Downloader verwenden möchten – laden Sie sie herunter, legen Sie sie im Plugin-Verzeichnis ab, aktivieren Sie sie in den Einstellungen und starten Sie die App neu:

* https://github.com/makehumancommunity/community-plugins-mhapi
* https://github.com/makehumancommunity/community-plugins-assetdownload
* https://github.com/makehumancommunity/community-plugins-socket
* https://github.com/makehumancommunity/makehuman-plugin-for-blender

### MakeHuman starten

Nachdem Sie dies getan haben, können Sie MakeHuman starten, indem Sie das Skript makehuman.py ausführen. Führen Sie dazu im Terminal Folgendes aus:

* python makehuman.py (unter Windows)
* python3 makehuman.py (unter Debian, Ubuntu, Mint...)

Alternativ gibt es ein Shell-Skript namens _makehuman_, um die Anwendung unter Linux-Systemen zu starten.

## Branches

Es gibt drei Standard-Branches und einige zusätzliche Entwickler-Branches:

* master: Hier finden Sie die neueste Version von MakeHuman.

Read-only-Referenz-Branches

* bitbucket-stable: Dies ist der Code, wie er im „stable“-Branch auf Bitbucket aussieht. Dies ist der Vorläufer des jetzigen „master“-Branches.
* bitbucket-default: Dies ist der Code, wie er im „default“-Branch auf Bitbucket aussieht.

Zusätzlich können Sie gelegentlich Feature-Branches sehen (in der Regel mit Namen wie \_feature...), die entfernt werden, nachdem sie in den Master-Branch zusammengeführt wurden.
