#!/bin/sh

cat <<EOF
    <section id="was-kann-ich-tun">
      <div class="content">
        <h2 class="title is-2 has-text-centered">
          Mach Druck und versende mit einem Klick einen Brief an die zuständigen Abgeordneten!
        </h2>
        <p>
          Bald wird im Innenausschuss über ein <i>Verbot biometrischer Fernidentifikation</i> beraten und wir wollen Abgeordnete überzeugen, die sich noch nicht klar positioniert haben.
          Klick dazu auf eine Partei/Fraktion, an die du appellieren möchtest und es öffnet sich automatisch eine von uns vorformulierte E-Mail.
          </br>
          Tipp: Anpassungen wie ein eigener Betreff, eine eigene Einleitung und natürlich euer Name am Ende der E-Mail helfen sehr dabei einen Eindruck zu hinterlassen.
          Versende die Mail für die größte Wirkung mit nur 3 Klicks an alle drei Ampel-Parteien!
        </p>
      </div>

      <div id="parties" class="columns is-multiline">
EOF

alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote(sys.argv[1]))"'

make_party_box () {
  party_short=$1
  party=$2
  logo=$3
  vor_salut=$4
  vor_first=$5
  vor_last=$6
  vor_addr=$7
  shift 7

  subj="Verbieten Sie automatisierte biometrische Fernidentifikation!"
  text=$(echo 'Sehr geehrte MdBs der Ausschüsse Inneres und Digitales,
SALUT,

gegenwärtig erleben wir eine Welle eingriffsintensiver Vorstöße aus dem Bundesinnenministerium. So soll das BKA in Zukunft heimlich Wohnräume durchsuchen und Personen anhand von Fotos im Internet identifizieren dürfen.

Doch auch bereits bestehende Technologien wie sogenannte „biometrische Fernidentifizierungssysteme“ stellen ein erhebliches Risiko für die Grundrechte der Menschen in Deutschland dar. Die anstehende Novellierung des Bundesdatenschutzgesetzes (BDSG) bietet an dieser Stelle jedoch die entscheidende Chance, den Einsatz dieser missbrauchsanfälligen Technologie im öffentlichen Raum zu verbieten und die Bewegungs-, Versammlungs- und Meinungsfreiheit der Menschen in Deutschland zu sichern.

Wie mehrere Expert:innen in der Anhörung zur BDSG-Novelle im Innenausschuss am 24. Juni 2024 bestätigt haben, bergen derartige biometrische Fernidentifizierungssysteme die Gefahr, dass Menschen sich im öffentlichen Raum nicht mehr anonym bewegen können. Durch flächendeckende Gesichtserkennung und andere biometrische Verfahren kann nachvollzogen werden, wer sich wann, wo und mit wem bewegt. Das betrifft die Wege zum Supermarkt und in die Arbeit, aber auch zur Gynäkologin und nicht zuletzt auch die Teilnahme an einer Demonstration.

Biometrische Merkmale zur Identifizierung von Personen stehen unter besonderem Schutz im nationalen und europäischen Datenschutzrecht. Gesicht, Stimme und Iris etc. können nicht verändert werden; die Person bleibt damit grundsätzlich ihr ganzes Leben identifizierbar. Die anlasslose Erhebung und Weiterverarbeitung dieser Merkmale unbeteiligter Menschen erhöht den Anpassungsdruck in der Gesellschaft ("chilling effects"). Gerade in demokratischen Gesellschaften ist es jedoch unerlässlich, dass die Menschen sich frei und ohne Überwachungsdruck bewegen können. Anonymität im öffentlichen Raum ist eine der Grundvoraussetzungen für freie Meinungsäußerung. Biometrische Fernidentifizierungssysteme jedoch gefährden diese zentrale Grundlage unserer Demokratie.

Ich fordere Sie daher auf: Tragen Sie nicht dazu bei, dass ein derart missbrauchsanfälliges Instrument geschaffen wird, mit dem Demokratiefeinde jetzt, oder in 10 Jahren – in NRW oder in Thüringen – gegen Andersdenkende vorgehen können.

An dieser Stelle können Sie als MdB und Mitglied des Innenausschusses oder des Ausschusses für Digitales einen Unterschied machen:

Der AI Act der Europäischen Union bietet auf nationaler Ebene und im Rahmen der BDSG-Novellierung die Chance, die Datenverarbeitung auf Grundlage biometrischer Fernidentifikationssysteme in öffentlich zugänglichen Räumen zu verbieten.

Ich bitte Sie daher um Folgendes: Setzen Sie sich innerhalb Ihrer Fraktion und im Innenausschuss oder im Ausschuss für Digitales dafür ein, dass das BDSG in 2. Lesung um ein Verbot der Verarbeitung personenbezogener Daten durch Verwendung biometrischer Fernidentifizierungssysteme (Art. 3 Nr. 41 KI-VO) in öffentlich zugänglichen Räumen ergänzt wird. Dies ist mit der KI-Verordnung vereinbar. Im Rahmen der genannten Sachverständigenanhörung wurden hierzu auch konkrete Formulierungsvorschläge vorgelegt.

Es ist unser aller Verantwortung, undemokratischen Kräften keine Werkzeuge auf den Schreibtisch zu legen, die diese missbrauchen können – und werden.

Vielen Dank und mit freundlichen Grüßen,

ihr*e Bürger*in' | sed "s/SALUT/$vor_salut $vor_first $vor_last/")

  addr_enc=$(urlencode "$vor_first $vor_last <$vor_addr>")
  subj_enc=$(urlencode "$subj")
  body_enc=$(urlencode "$text")
  cc_enc=""
  all_addrs="$vor_first $vor_last <$vor_addr>"
  for mgl in "$@"; do
    mgl_enc=$(urlencode "$mgl")
    cc_enc="${cc_enc}cc=${mgl_enc}\&"
    all_addrs="${all_addrs}, $mgl"
  done
  link="mailto:$addr_enc?subject=$subj_enc\&${cc_enc}body=$body_enc"

  cat <<EOF
        <div class="column is-one-third">
          <article class="card">
            <div class="card-image">
              <a href="$link" target="_blank">
                <img src="img/logo/$logo">
              </a>
            </div>
            <div class="card-content">
              <a href="$link">
                <p class="title">$party</p>
              </a>
            </div>
          </article>
          <script type="text/javascript">
            function copy_${party_short}_mailtext() {
              navigator.clipboard.writeText(\`$text\`);
              var button = document.getElementById("${party_short}_mailtext");
              if (button) {
                button.classList.add("is-light");
              }
            }
            function copy_${party_short}_addresses() {
              navigator.clipboard.writeText("$all_addrs");
              var button = document.getElementById("${party_short}_addresses");
              if (button) {
                button.classList.add("is-light");
              }
            }
          </script>
        </div>
EOF
}

make_party_box spd SPD SPD.png \
  "sehr geehrte Berichterstatterin Frau" Carmen Wegge carmen.wegge@bundestag.de \
  "Sebastian Hartmann <sebastian.hartmann@bundestag.de>" \
  "Prof. Dr. Lars Castellucci <lars.castellucci@bundestag.de>" \
  "Daniel Baldy <daniel.baldy@bundestag.de>" \
  "Hakan Demir <hakan.demir@bundestag.de>" \
  "Sebastian Fiedler <sebastian.fiedler@bundestag.de>" \
  "Simona Koß <simona.koss@bundestag.de>" \
  "Dunja Kreiser <dunja.kreiser@bundestag.de>" \
  "Helge Lindh <helge.lindh@bundestag.de>" \
  "Dorothee Martin <dorothee.martin@bundestag.de>" \
  "Ingo Schäfer <ingo.schaefer@bundestag.de>" \
  "Peggy Schierenbeck <peggy.schierenbeck@bundestag.de>" \
  "Gülistan Yüksel <guelistan.yueksel@bundestag.de>" \
  "Dirk Wiese <dirk.wiese@bundestag.de>" \
  "Dr. Holger Becker <holger.becker@bundestag.de>" \
  "Anna Kassautzki <anna.kassautzki@bundestag.de>" \
  "Tim Klüssendorf <tim.kluessendorf@bundestag.de>" \
  "Parsa Marvi <parsa.marvi@bundestag.de>" \
  "Robin Mesarosch <robin.mesarosch@bundestag.de>" \
  "Matthias Mieves <matthias.mieves@bundestag.de>" \
  "Johannes Schätzl <johannes.schaetzl@bundestag.de>" \
  "Dr. Carolin Wagner <carolin.wagner@bundestag.de>" \
  "Dr. Jens Zimmermann <jens.zimmermann@bundestag.de>" \
  "Armand Zorn <armand.zorn@bundestag.de>" \
  "Saskia Esken <saskia.esken@bundestag.de>" \
  "Metin Hakverdi <metin.hakverdi@bundestag.de>"

make_party_box gruene "Bündnis 90/Die Grünen" B90Gruene.jpg \
  "sehr geehrte Berichterstatterin Frau" Misbah Khan misbah.khan@bundestag.de \
  "Maik Außendorf <maik.aussendorf@bundestag.de>" \
  "Tobias Bacherle <tobias.bacherle@bundestag.de>" \
  "Tabea Rößner <tabea.roessner@bundestag.de>" \
  "Dr. Anna Christmann <anna.christmann@bundestag.de>" \
  "Sabine Grützmacher <sabine.gruetzmacher@bundestag.de>" \
  "Maria Klein-Schmeink <maria.klein-schmeink@bundestag.de>" \
  "Dr. Konstantin von Notz <Konstantin.notz@bundestag.de>" \
  "Marcel Emmerich <marcel.emmerich@bundestag.de>" \
  "Lamya Kaddor <lamya.kaddor@bundestag.de>" \
  "Leon Eckert <leon.eckert@bundestag.de>" \
  "Katrin Göring-Eckardt <katrin.goering-eckardt@bundestag.de>" \
  "Dr. Konstantin Notz <konstantin.notz@bundestag.de>" \
  "Julian Pahlke <julian.pahlke@bundestag.de>" \
  "Marlene Schönberger <marlene.schoenberger@bundestag.de>"

make_party_box fdp FDP FDP.png \
  "sehr geehrter Berichterstatter Herr" Manuel Höferlin manuel.hoeferlin@bundestag.de \
  "Sandra Bubendorfer-Licht <sandra.bubendorfer-licht@bundestag.de>" \
  "Dr. Ann-Veruschka Jurisch <ann-veruschka.jurisch@bundestag.de>" \
  "Dr. Volker Redder <volker.redder@bundestag.de>" \
  "Linda Teuteberg <linda.teuteberg@bundestag.de>" \
  "Stephan Thomae <stephan.thomae@bundestag.de>" \
  "Maximilian Funke-Kaiser <maximilian.funke-kaiser@bundestag.de>" \
  "Maximilian Mordhorst <maximilian.mordhorst@bundestag.de>" \
  "Dr. Volker Redder <volker.redder@bundestag.de>" \
  "Frank Schäffler <frank.schaeffler@bundestag.de>"

cat <<EOF
      </div>


      <div class="content is-size-5">
        </br>
        <h3 class="title is-4">
          Probleme?
        </h3>
        <p>
          Falls du kein E-Mail Program hast das die links oben unterstützt, oder nicht die Adressen aller Abgeordneten angezeigt werden, kannst du hier den Mailtext und die Adressen mit zwei Klicks in deine E-Mail kopieren:
        </p>
      </div>

      <div id="backup" class="columns is-multiline">
        <div class="column is-one-third">
          <article class="card">
            <div class="card-content">
              <p class="title">SPD</p>
              <div class="buttons">
                <button id="spd_addresses" class="button is-medium is-fullwidth is-danger" onclick="copy_spd_addresses()">Kopiere Adressen</button>
                <button id="spd_mailtext" class="button is-medium is-fullwidth is-danger" onclick="copy_spd_mailtext()">Kopiere Mailtext</button>
              </div>
            </div>
          </article>
        </div>
        <div class="column is-one-third">
          <article class="card">
            <div class="card-content">
              <p class="title">Bündnis 90/Die Grünen</p>
              <div class="buttons">
                <button id="gruene_addresses" class="button is-medium is-fullwidth is-success" onclick="copy_gruene_addresses()">Kopiere Adressen</button>
                <button id="gruene_mailtext" class="button is-medium is-fullwidth is-success" onclick="copy_gruene_mailtext()">Kopiere Mailtext</button>
              </div>
            </div>
          </article>
        </div>
        <div class="column is-one-third">
          <article class="card">
            <div class="card-content">
              <p class="title">FDP</p>
              <div class="buttons">
                <button id="fdp_addresses" class="button is-medium is-fullwidth is-warning" onclick="copy_fdp_addresses()">Kopiere Adressen</button>
                <button id="fdp_mailtext" class="button is-medium is-fullwidth is-warning" onclick="copy_fdp_mailtext()">Kopiere Mailtext</button>
              </div>
            </div>
          </article>
        </div>
      </div>

      <div class="content is-size-5">
        </br>
        <p>
          Unsere vorformulierte E-Mail ist adressiert an die/den jeweilige:n Berichterstatter:in mit allen Ausschussmitgliedern und lautet:
        </p>
        <h4 class="title is-5">
          Betreff: Verbieten Sie automatisierte biometrische Fernidentifikation!
        </h4>
        <p>
          Sehr geehrte MdBs der Ausschüsse Inneres und Digitales,
          </br>
          sehr geehrte(r) Berichterstatter(in) Herr/Frau So Und So,
        </p>
        </br>
        <p>
          gegenwärtig erleben wir eine Welle eingriffsintensiver Vorstöße aus dem Bundesinnenministerium. So soll das BKA in Zukunft heimlich Wohnräume durchsuchen und Personen anhand von Fotos im Internet identifizieren dürfen.
        </p>
        <p>
          Doch auch bereits bestehende Technologien wie sogenannte „biometrische Fernidentifizierungssysteme“ stellen ein erhebliches Risiko für die Grundrechte der Menschen in Deutschland dar. Die anstehende Novellierung des Bundesdatenschutzgesetzes (BDSG) bietet an dieser Stelle jedoch die entscheidende Chance, den Einsatz dieser missbrauchsanfälligen Technologie im öffentlichen Raum zu verbieten und die Bewegungs-, Versammlungs- und Meinungsfreiheit der Menschen in Deutschland zu sichern.
        </p>
        <p>
          Wie mehrere Expert:innen in der Anhörung zur BDSG-Novelle im Innenausschuss am 24. Juni 2024 bestätigt haben, bergen derartige biometrische Fernidentifizierungssysteme die Gefahr, dass Menschen sich im öffentlichen Raum nicht mehr anonym bewegen können. Durch flächendeckende Gesichtserkennung und andere biometrische Verfahren kann nachvollzogen werden, wer sich wann, wo und mit wem bewegt. Das betrifft die Wege zum Supermarkt und in die Arbeit, aber auch zur Gynäkologin und nicht zuletzt auch die Teilnahme an einer Demonstration.
        </p>
        <p>
          Biometrische Merkmale zur Identifizierung von Personen stehen unter besonderem Schutz im nationalen und europäischen Datenschutzrecht. Gesicht, Stimme und Iris etc. können nicht verändert werden; die Person bleibt damit grundsätzlich ihr ganzes Leben identifizierbar. Die anlasslose Erhebung und Weiterverarbeitung dieser Merkmale unbeteiligter Menschen erhöht den Anpassungsdruck in der Gesellschaft ("chilling effects"). Gerade in demokratischen Gesellschaften ist es jedoch unerlässlich, dass die Menschen sich frei und ohne Überwachungsdruck bewegen können. Anonymität im öffentlichen Raum ist eine der Grundvoraussetzungen für freie Meinungsäußerung. Biometrische Fernidentifizierungssysteme jedoch gefährden diese zentrale Grundlage unserer Demokratie.
        </p>
        <p>
          Ich fordere Sie daher auf: Tragen Sie nicht dazu bei, dass ein derart missbrauchsanfälliges Instrument geschaffen wird, mit dem Demokratiefeinde jetzt, oder in 10 Jahren – in NRW oder in Thüringen – gegen Andersdenkende vorgehen können.
        </p>
        <p>
          An dieser Stelle können Sie als MdB und Mitglied des Innenausschusses oder des Ausschusses für Digitales einen Unterschied machen:
        </p>
        <p>
          Der AI Act der Europäischen Union bietet auf nationaler Ebene und im Rahmen der BDSG-Novellierung die Chance, die Datenverarbeitung auf Grundlage biometrischer Fernidentifikationssysteme in öffentlich zugänglichen Räumen zu verbieten.
        </p>
        <p>
          Ich bitte Sie daher um Folgendes: Setzen Sie sich innerhalb Ihrer Fraktion und im Innenausschuss oder im Ausschuss für Digitales dafür ein, dass das BDSG in 2. Lesung um ein Verbot der Verarbeitung personenbezogener Daten durch Verwendung biometrischer Fernidentifizierungssysteme (Art. 3 Nr. 41 KI-VO) in öffentlich zugänglichen Räumen ergänzt wird. Dies ist mit der KI-Verordnung vereinbar. Im Rahmen der genannten Sachverständigenanhörung wurden hierzu auch konkrete Formulierungsvorschläge vorgelegt.
        </p>
        <p>
          Es ist unser aller Verantwortung, undemokratischen Kräften keine Werkzeuge auf den Schreibtisch zu legen, die diese missbrauchen können – und werden.
        </p>
        </br>
        <p>
          Vielen Dank und mit freundlichen Grüßen,

          </br>
          ihr*e Bürger*in
        </p>
      </div>

      <script type="text/javascript">
        var parties = document.getElementById('parties');
        var backup = document.getElementById('backup');
        for (var i = parties.children.length; i >= 0; i--) {
          var x = Math.random() * i;
          if (parties) {
            parties.appendChild(parties.children[x | 0]);
          }
          if (backup) {
            backup.appendChild(backup.children[x | 0]);
          }
        }
      </script>

      <div class="content">
        </br>
        <h2 class="title is-2 has-text-centered">Auf dem Laufenden bleiben</h2>
        <p class="title is-4"> 
          Du möchtest erfahren, wenn es eine Petition oder Protest-Aktionen gibt?
        </p>
        </br>
        <p class="title is-3"> 
          <a href="https://social.tchncs.de/@DigitaleFreiheit" style="color:white">
          Folge uns auf Mastodon
          </a>  
        </p>
        </br>
        <p class="title is-3"> 
          <a href="https://www.instagram.com/digitale.freiheit/" style="color:white">
          Folge uns auf Instagram
          </a> 
        </p>
        </br>
        <p class="title is-3"> 
          <a href="https://www.facebook.com/DigitaleFreiheit" style="color:white">
          Folge uns auf Facebook
          </a> 
        </p>
        <p>
          Keine Lust auf datenhungrige soziale Netzwerke? Schick uns die vorformulierte Mail, um sich für den Kampagnen-Newsletter einzutragen:
        </p>
      </div>
      <div class="columns">
        <a href="mailto:mail@digitale-freiheit.jetzt?subject=Gesichtserkennung Stoppen Newsletter&body=Ich möchte gerne den Newsletter der Gesichtserkennung Stoppen Kampagne abonnieren, um über zukünftige Entwicklungen auf dem Laufenden gehalten zu werden. Den Newsletter kann ich jederzeit abbestellen."class="column is-three-fifths is-offset-one-fifth">
          <p class="button title is-size-3">
            Jetzt Newsletter abonnieren!
          </p>
        </a>
      </div>

    </section>
EOF

