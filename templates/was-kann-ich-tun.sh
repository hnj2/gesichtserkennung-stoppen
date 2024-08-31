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
          Versende die Meil für die größte Wirkung mit nur 3 Klicks an alle drei Ampel-Parteien!
        </p>
      </div>

      <div id="abgeordnete" class="columns is-multiline">
EOF

alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote(sys.argv[1]))"'

make_box () {
  salut=$1
  first=$2
  last=$3
  addr=$4
  party=$5
  photo=$6
  credit=$7

  subj="Verbieten Sie automatisierte biometrische Fernidentifikation!"
  text=$(echo 'SALUT,

gegenwärtig erleben wir eine Welle eingriffsintensiver Vorstöße aus dem Bundesinnenministerium. So soll das BKA in Zukunft heimlich Wohnräume durchsuchen und Personen anhand von Fotos im Internet identifizieren dürfen.

Doch auch bereits bestehende Technologien wie sogenannte „biometrische Fernidentifizierungssysteme“ stellen ein erhebliches Risiko für die Grundrechte der Menschen in Deutschland dar. Die anstehende Novellierung des BDSG bietet an dieser Stelle jedoch die entscheidende Chance, den Einsatz dieser missbrauchsanfälligen Technologie im öffentlichen Raum zu verbieten und die Bewegungs-, Versammlungs- und Meinungsfreiheit der Menschen in Deutschland zu sichern.

Wie mehrere Expert:innen in der Anhörung zur BDSG-Novelle im Innenausschuss am 24. Juni 2024 bestätigt haben, bergen derartige biometrische Fernidentifizierungssysteme die Gefahr, dass Menschen sich im öffentlichen Raum nicht mehr anonym bewegen können. Durch flächendeckende Gesichtserkennung und andere biometrische Verfahren kann nachvollzogen werden, wer sich wann, wo und mit wem bewegt. Das betrifft die Wege zum Supermarkt und in die Arbeit, aber auch zur Gynäkologin und nicht zuletzt auch die Teilnahme an einer Demonstration.

Biometrische Merkmale zur Identifizierung von Personen stehen unter besonderem Schutz im nationalen und europäischen Datenschutzrecht. Gesicht, Stimme und Iris etc. können nicht verändert werden; die Person bleibt damit grundsätzlich ihr ganzes Leben identifizierbar. Die anlasslose Erhebung und Weiterverarbeitung dieser Merkmale unbeteiligter Menschen erhöht den Anpassungsdruck in der Gesellschaft ("chilling effects"). Gerade in demokratischen Gesellschaften ist es jedoch unerlässlich, dass die Menschen sich frei und ohne Überwachungsdruck bewegen können. Anonymität im öffentlichen Raum ist eine der Grundvoraussetzungen für freie Meinungsäußerung. Biometrische Fernidentifizierungssysteme jedoch gefährden diese zentrale Grundlage unserer Demokratie.

Wir fordern Sie daher auf: Tragen Sie nicht dazu bei, dass ein derart missbrauchsanfälliges Instrument geschaffen wird, mit dem Demokratiefeinde jetzt, oder in 10 Jahren – in NRW oder in Thüringen – gegen Andersdenkende vorgehen können.

An dieser Stelle können Sie als MdB und Mitglied des Innenausschusses einen Unterschied machen:

Der AI Act der Europäischen Union bietet auf nationaler Ebene und im Rahmen der BDSG-Novellierung die Chance, die Datenverarbeitung auf Grundlage biometrischer Fernidentifikationssysteme in öffentlich zugänglichen Räumen zu verbieten.

Ich bitte Sie daher um Folgendes: Setzen Sie sich innerhalb Ihrer Fraktion und im Innenausschuss dafür ein, dass das BDSG in 2. Lesung um ein Verbot der Verarbeitung personenbezogener Daten durch Verwendung biometrischer Fernidentifizierungssysteme (Art. 3 Nr. 41 KI-VO) in öffentlich zugänglichen Räumen ergänzt wird. Dies ist mit der KI-Verordnung vereinbar. Im Rahmen der genannten Sachverständigenanhörung wurden hierzu auch konkrete Formulierungsvorschläge vorgelegt.

Es ist unser aller Verantwortung, undemokratischen Kräften keine Werkzeuge auf den Schreibtisch zu legen, die diese missbrauchen können – und werden.

Vielen Dank und mit freundlichen Grüßen,

ihr*e Bürger*in' | sed "s/SALUT/$salut $first $last/")

  addr_enc=$(urlencode "$first $last <$addr>")
  subj_enc=$(urlencode "$subj")
  body_enc=$(urlencode "$text")
  link="mailto:$addr_enc?subject=$subj_enc\&body=$body_enc"

  box=$(cat <<EOF
        <div class="column is-one-third">
          <article class="card">
            <div class="card-image">
              <a href="LINK" target="_blank">
                <img src="img/person/PHOTO">
              </a>
              <div class="dropdown is-hoverable is-up is-right foto-info">
                <div class="dropdown-trigger tag is-rounded">Foto</div>
                <div class="dropdown-menu" role="menu">
                  <div class="dropdown-content">
                    <div class="dropdown-item">
                      <p>Deutscher Bundestag</br>CREDIT</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-content">
              <a href="LINK">
                <p class="title">NAME</p>
                <p class="subtitle">PARTY</p>
              </a>
            </div>
          </article>
        </div>
EOF
)
    echo "$box"         \
    | sed "s/LINK/$link/" \
    | sed "s/NAME/$first $last/" \
    | sed "s/PARTY/$party/" \
    | sed "s/PHOTO/$photo/" \
    | sed "s/CREDIT/$credit/"
}

make_party_box () {
  party=$1
  logo=$2
  vor_salut=$3
  vor_first=$4
  vor_last=$5
  vor_addr=$6
  shift 6

  subj="Verbieten Sie automatisierte biometrische Fernidentifikation!"
  text=$(echo 'Sehr geehrte Mitglieder*innen des Innenausschusses,
SALUT,

gegenwärtig erleben wir eine Welle eingriffsintensiver Vorstöße aus dem Bundesinnenministerium. So soll das BKA in Zukunft heimlich Wohnräume durchsuchen und Personen anhand von Fotos im Internet identifizieren dürfen.

Doch auch bereits bestehende Technologien wie sogenannte „biometrische Fernidentifizierungssysteme“ stellen ein erhebliches Risiko für die Grundrechte der Menschen in Deutschland dar. Die anstehende Novellierung des BDSG bietet an dieser Stelle jedoch die entscheidende Chance, den Einsatz dieser missbrauchsanfälligen Technologie im öffentlichen Raum zu verbieten und die Bewegungs-, Versammlungs- und Meinungsfreiheit der Menschen in Deutschland zu sichern.

Wie mehrere Expert:innen in der Anhörung zur BDSG-Novelle im Innenausschuss am 24. Juni 2024 bestätigt haben, bergen derartige biometrische Fernidentifizierungssysteme die Gefahr, dass Menschen sich im öffentlichen Raum nicht mehr anonym bewegen können. Durch flächendeckende Gesichtserkennung und andere biometrische Verfahren kann nachvollzogen werden, wer sich wann, wo und mit wem bewegt. Das betrifft die Wege zum Supermarkt und in die Arbeit, aber auch zur Gynäkologin und nicht zuletzt auch die Teilnahme an einer Demonstration.

Biometrische Merkmale zur Identifizierung von Personen stehen unter besonderem Schutz im nationalen und europäischen Datenschutzrecht. Gesicht, Stimme und Iris etc. können nicht verändert werden; die Person bleibt damit grundsätzlich ihr ganzes Leben identifizierbar. Die anlasslose Erhebung und Weiterverarbeitung dieser Merkmale unbeteiligter Menschen erhöht den Anpassungsdruck in der Gesellschaft ("chilling effects"). Gerade in demokratischen Gesellschaften ist es jedoch unerlässlich, dass die Menschen sich frei und ohne Überwachungsdruck bewegen können. Anonymität im öffentlichen Raum ist eine der Grundvoraussetzungen für freie Meinungsäußerung. Biometrische Fernidentifizierungssysteme jedoch gefährden diese zentrale Grundlage unserer Demokratie.

Wir fordern Sie daher auf: Tragen Sie nicht dazu bei, dass ein derart missbrauchsanfälliges Instrument geschaffen wird, mit dem Demokratiefeinde jetzt, oder in 10 Jahren – in NRW oder in Thüringen – gegen Andersdenkende vorgehen können.

An dieser Stelle können Sie als MdB und Mitglied des Innenausschusses einen Unterschied machen:

Der AI Act der Europäischen Union bietet auf nationaler Ebene und im Rahmen der BDSG-Novellierung die Chance, die Datenverarbeitung auf Grundlage biometrischer Fernidentifikationssysteme in öffentlich zugänglichen Räumen zu verbieten.

Ich bitte Sie daher um Folgendes: Setzen Sie sich innerhalb Ihrer Fraktion und im Innenausschuss dafür ein, dass das BDSG in 2. Lesung um ein Verbot der Verarbeitung personenbezogener Daten durch Verwendung biometrischer Fernidentifizierungssysteme (Art. 3 Nr. 41 KI-VO) in öffentlich zugänglichen Räumen ergänzt wird. Dies ist mit der KI-Verordnung vereinbar. Im Rahmen der genannten Sachverständigenanhörung wurden hierzu auch konkrete Formulierungsvorschläge vorgelegt.

Es ist unser aller Verantwortung, undemokratischen Kräften keine Werkzeuge auf den Schreibtisch zu legen, die diese missbrauchen können – und werden.

Vielen Dank und mit freundlichen Grüßen,

ihr*e Bürger*in' | sed "s/SALUT/$vor_salut $vor_first $vor_last/")

  addr_enc=$(urlencode "$vor_first $vor_last <$vor_addr>")
  subj_enc=$(urlencode "$subj")
  body_enc=$(urlencode "$text")
  cc_enc=""
  for mgl in "$@"; do
    mgl_enc=$(urlencode "$mgl")
    cc_enc="${cc_enc}cc=${mgl_enc}\&"
  done
  link="mailto:$addr_enc?subject=$subj_enc\&${cc_enc}body=$body_enc"

  box=$(cat <<EOF
        <div class="column is-one-third">
          <article class="card">
            <div class="card-image">
              <a href="LINK" target="_blank">
                <img src="img/logo/LOGO">
              </a>
            </div>
            <div class="card-content">
              <a href="LINK">
                <p class="title">PARTY</p>
              </a>
            </div>
          </article>
        </div>
EOF
)
    echo "$box"         \
    | sed "s/LINK/$link/" \
    | sed "s/PARTY/$party/" \
    | sed "s/LOGO/$logo/"
}

make_party_box SPD SPD.png "sehr geehrte Frau Vorsitzende" Carmen Wegge carmen.wegge@bundestag.de "mitgl eins <eins@example.org>" "mgl zwei <zwei@example.org" "asdf qwer <asdf.wqer@example.org>"
#make_party_box "sehr geehrte Frau Vorsitzende" Carmen Wegge carmen.wegge@bundestag.de "mitgl eins <eins@example.org>; mitgl zwei <zwei@example.org>" SPD.png

make_box "Sehr geehrte Frau"  Carmen Wegge       carmen.wegge@bundestag.de          "SPD" wegge_carmen.jpg       "Susie Knoll"
make_box "Sehr geehrter Herr" Daniel Baldy       daniel.baldy.wk@bundestag.de       "SPD" baldy_daniel.jpg       "Christian Spies"
make_box "Sehr geehrte Frau"  Dorothee Martin    dorothee.martin@bundestag.de       "SPD" martin_dorothee.jpg    "Photothek"
make_box "Sehr geehrte Frau"  Dunja Kreiser      dunja.kreiser.wk@bundestag.de      "SPD" kreiser_dunja.jpg      "Photothek"
make_box "Sehr geehrte Frau"  Gülistan Yüksel    guelistan.yueksel@bundestag.de     "SPD" yueksel_guelistan.jpg  "Inga Haar"
make_box "Sehr geehrter Herr" Hakan Demir        hakan.demir@bundestag.de           "SPD" demir_hakan.jpg        "Max Neudert"
make_box "Sehr geehrter Herr" Helge Lindh        helge.lindh@bundestag.de           "SPD" lindh_helge.jpg        "Photothek"
make_box "Sehr geehrter Herr" Ingo Schäfer       ingo.schaefer@bundestag.de         "SPD" schaefer_ingo.jpg      "Daniel Koke"
make_box "Sehr geehrte Frau"  Peggy Schierenbeck peggy.schierenbeck.wk@bundestag.de "SPD" schierenbeck_peggy.jpg "Katja Thiele"
make_box "Sehr geehrter Herr" Sebastian Fiedler  sebastian.fiedler.wk@bundestag.de  "SPD" fiedler_sebastian.jpg  "Photothek"
make_box "Sehr geehrte Frau"  Simona Koß         simona.koss@bundestag.de           "SPD" koss_simona.jpg        "Photothek"
make_box "Sehr geehrter Herr" Lars Castellucci   lars.castellucci@bundestag.de      "SPD" castellucci_lars.jpg   "Stella von Saldern"
make_box "Sehr geehrter Herr" Sebastian Hartmann sebastian.hartmann@bundestag.de    "SPD" hartmann_sebastian.jpg "Sebastian Hartmann"
  
cat <<EOF
      </div>

      <script type="text/javascript">
        var abg = document.getElementById('abgeordnete');
        if (abg) {
          for (var i = abg.children.length; i >= 0; i--) {
            abg.appendChild(abg.children[Math.random() * i | 0]);
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

