# Schoenberg-Data

Das Repo „Schoenberg-Data“ bildet die Datenveröffentlichung der Edition _Arnold Schönberg: Briefwechsel mit den Verlagen Universal-Edition und Dreililien_
([https://www.schoenberg-ue.at](https://www.schoenberg-ue.at/)). Diese beinhaltet die XML-Dateien der edierten Briefe und Dokumente sowie verschiedene Register, welche alle nach den Richtlinien der [TEI](https://tei-c.org/guidelines/) kodiert sind, und deren Dokumentation, die sowohl als ausformulierte Editions- und Kodierungsrichtlinien des Projektes wie auch als technisches Schema zur Validierung der TEI-Dateien vorliegt. Da die Edition als Hybridausgabe konzipiert ist, wobei die XML-Daten auch die Grundlage für die Printpublikation bilden, finden sich im Ordner "print-workflow" Dateien, die für die Erstellung der Druckvorlage verwendet wurden. Die Webapplikation des Projektes ist in einem separaten Repo veröffentlicht.

Es folgt eine genauere Aufschlüsselung der Inhalte des Repos:

| Ordner | Datei/Unterordner| Beschreibung |
| --- | --- | --- |
| /data | | |
| | /letters | Die edierten Briefe des Projekts im TEI-Format, jahresweise geordnet
| | /documents | Sekundäre Materialien im TEI-Format, jahresweise geordnet
| | /indices | Registerdateien für Personen, Organisationen, Orte, Werke, Ereignisse und Briefstempel/Vordrucke im TEI-Format
| | Versionen.xml | Informationen zu den bisher erfolgten Releases der digitalen Edition
| /guidelines | | Beinhaltet die Editionsrichtlinien des Projekts wie auf der entsprechenden [Webseite](https://www.schoenberg-ue.at/ue/editionsrichtlinien) der Online-Edition angezeigt im XML-Format und als HTML-Datei sowie das Skript zur Generierung des HTML, die in der XML-Datei referenzierten Code-Beispiele und die Javascript-Bibliothek _prettify.js_ zur Syntaxhervorhebung der Code-Beispiele
| /print-workflow | | |
| | /XML-Workflow | Skripte und Zwischenstände der Aufbereitung der Brieftexte für die Printpublikation
| | /idjs-scripts | Skripte für die Ausführung in _Adobe InDesign_ zum XML-Import und zur Formatierung der Inhalte
| /schema | | Das TEI-Schema der Edition basiert auf dem Schema von _ediarum_ (siehe [ediarum.BASE.data-model](https://github.com/ediarum/ediarum.BASE.data-model/tree/dev) sowie [ediarum.REGISTER.data-model](https://github.com/ediarum/ediarum.REGISTER.data-model)) und wird per ODD-Chaining aus diesen Schemata und den projektspezifischen Modifikationen in den folgenden ODDs generiert: 
| | ediarum.asue.odd | ODD für die Briefe und Dokumente
| | ediarum.asue.register.odd | ODD für die Registerdateien
| | ediarum.asue.api.odd | ODD für die Briefe und Dokumente in der Form, wie sie in der Webapp zum Download angeboten werden (hier werden etwa keys zu absoluten URLs aufgelöst)
| | datatypes.odd.xml | Definitionen von  projektspezifischen Datentypen, auf die die ODD-Dateien referenzieren
| | mei-source.xml | ODD der Guidelines der [Music Encoding Initiative](https://music-encoding.org/), auf welcher die Kodierung von Notenbeispielen in den Briefen basiert
| | /out | enthält Schema-Dateien im [Relax-NG](https://relaxng.org/) Format
| | /compiledODD | enthält Schema-Dateien in Compiled ODD (ODD mit erweiterter Dokumentation und aufgelösten Referenzen)
| | /XSL | XSL-Skript zur Generierung der Compiled ODD aus der Source ODD
