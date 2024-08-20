#!/bin/sh

cat <<EOF
    <section id="was-kann-ich-tun">
      <div class="content">
        <h2 class="title is-2 has-text-centered">
          Mach Druck und versende mit einem Klick einen Brief an die Verantwortlichen!
        </h2>
        <p>
          Bald wird abgestimmt, wir wollen Abgeordnete überzeugen, die sich noch nicht klar positioniert haben.
          Klick dazu auf eine:n Abgeordnete:n, an die oder den du appellieren möchtest und es öffnet sich automatisch eine von uns vorformulierte E-Mail.
          </br>
          Tipp: Anpassungen wie ein eigener Betreff, eine eigene Einleitung und natürlich euer Name am Ende der E-Mail helfen sehr dabei einen Eindruck zu hinterlassen.
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

  subj="Verbieten Sie automatisierte biometrischer Fernidentifikation!"
  text=$(echo 'SALUT,

nachdem der AI Act einen ersten Rahmen für die verantwortungsvolle Nutzung neuer Technologien geschaffen hat, haben Sie mit der Novellierung des BDSG die Chance, die Bewegungs-, Versammlungs- und Meinungsfreiheit der Menschen in Deutschland krisensicher zu machen.

Denn wie Expert:innen in der Anhörung zur BDSG-Novelle im Bundestag am 24. Juni 2024 bestätigt haben, birgt die sog. „automatisierte biometrische Fernidentifikation“ die Gefahr, dass Menschen sich im öffentlichen Raum nicht mehr anonym bewegen können. Durch flächendeckende Gesichtserkennung und andere biometrische Verfahren kann nachvollzogen werden, wer sich wann, wo und mit wem bewegt. Das betrifft die Wege zum Supermarkt und in die Arbeit, aber auch zur Gynäkologin und nicht zuletzt auch die Teilnahme an einer Demonstration.

Biometrische Merkmale zur Identifizierung von Personen stehen unter besonderem Schutz im nationalen und europäischen Datenschutzrecht. Gesicht, Stimme und Iris etc. können nicht verändert werden; die Person bleibt damit grundsätzlich ihr ganzes Leben identifizierbar. Die anlasslose Erhebung und Weiterverarbeitung dieser Merkmale erhöht den Anpassungsdruck in der Gesellschaft ("chilling effects"). Gerade in demokratischen Gesellschaften ist es jedoch unerlässlich, dass die Menschen sich frei und ohne Überwachungsdruck bewegen können.

Wir fordern Sie daher auf: Tragen Sie nicht dazu bei, dass ein derart missbrauchsanfälliges Instrument geschaffen wird, mit dem Demokratiefeinde jetzt, oder in 10 Jahren, in NRW oder in Thüringen gegen kritische Stimmen vorgehen können. Es ist unser aller Verantwortung, undemokratischen Kräften keine Werkzeuge auf den Schreibtisch zu legen, die diese missbrauchen werden.

An dieser Stelle können Sie einen Unterschied machen:
Nach der Verabschiedung des AI Acts besteht nun auf nationaler Ebene und im Rahmen der BDSG-Novellierung die Chance, „biometrische Fernidentifikation“ im öffentlich Raum zu verbieten. Dies sichert die wertvolle Errungenschaft, dass die Menschen in Deutschland sich im Alltag frei und ohne Angst vor permanenter Erfassung ihres Aufenthalts bewegen können. Dies sollte weiterhin selbstverständlich sein.

Wir bitten Sie daher um Folgendes: Setzen Sie sich innerhalb Ihrer Fraktion und im Innenausschuss dafür ein, dass das BDSG um ein (mit der KI-VO rechtlich vereinbares) Verbot automatisierter biometrischer Fernidentifikation ergänzt wird.

Der Kampf gegen den Terrorismus ist ein absolutes legitimes Ziel. Nun geht es darum, zielgerichtete Maßnahmen zu ergreifen, bei der nicht 99,9% der Bevölkerung massive Grundrechtsverletzungen hinnehmen müssen.

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

make_box "Sehr geehrter Herr" Daniel Baldy       daniel.baldy.wk@bundestag.de       "SPD" baldy_daniel.jpg       "Christian Spies"
make_box "Sehr geehrte Frau"  Dorothee Martin    dorothee.martin@bundestag.de       "SPD" martin_dorothee.jpg    "Photothek"
make_box "Sehr geehrte Frau"  Dunja Kreiser      dunja.kreiser.wk@bundestag.de      "SPD" kreiser_dunja.jpg      "Photothek"
make_box "Sehr geehrte Frau"  Gülistan Yüksel    guelistan.yueksel@bundestag.de     "SPD" yueksel_guelistan.jpg "Inga Haar"
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

