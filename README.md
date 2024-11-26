# Proiect-GeneratiaTech
## Sistem de Detecție a Accidentelor Rutiere cu Spring Boot
#### Acest proiect a fost realizat pentru a veni în ajutorul unui prieten. Sistemul este compus dintr-o componentă hardware și una software.
### Hardware
Partea hardware utilizează un Arduino Nano, la care sunt conectate: <br/>
-Modul GSM <br/>
-Modul GPS <br/>
-Accelerometru/Giroscop <br/>
![image](https://github.com/user-attachments/assets/17aa12f5-da09-404c-aa41-f07d0b6cde54) <br/>
Schema bloc(fara ESP) <br/>
 Accelerometrul și giroscopul furnizează parametrii precum amplitudinea și intensitatea. Pe baza valorilor acestora:<br/>
 -Se afișează mesaje relevante (am inclus codul Arduino și un videoclip demonstrativ).<br/>
 -La depășirea unor valori prestabilite, sistemul trimite automat un SMS cu un link către locația accidentului. (Puteți vedea și o captură de ecran a mesajului trimis pentru demonstrație).
### Software
 Pentru partea software, am utilizat un server Spring Boot conectat la o bază de date, unde pot fi stocate datele primite de la senzori.<br/>
 Planuri de dezvoltare:
 În funcție de timpul disponibil (imedia vine seiunea de la master O-O), intenționez să: <br/>
-Adaug o interfață web realizată în HTML și CSS.<br/>
-Dezvolt o aplicație Android, având deja experiență cu astfel de proiecte.<br/>

### Updates
#### Ver 0.3
In aceasta versiune , se pot folosi functi de post si de get , pentru a pune si afisa datele din MySql.A fost testat cu PostMan.Sa realizat progres si la partea de hardware , am reusit sa transmitem date direct de la Esp8266 la servar automat.
