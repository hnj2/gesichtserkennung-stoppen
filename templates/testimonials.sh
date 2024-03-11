#!/bin/sh

cat <<EOF
    <section id="testimonials-section">
      <a class="anchor" name="testimonials"></a>
      <h2>Testimonials</h2>

      <div class="columns is-multiline">
EOF

make_box () {
    box=$(cat <<EOF

        <div class="column is-half">
          <article class="card">
            <video class="is-16by9" controls preload="none" poster="video_poster/SHORTNAME.jpg">
              <source src="videos/SHORTNAME.mp4" type="video/mp4">
            </video>
            <div class="card-content">
              <a href="LINK" target="_blank">
                <p class="title">NAME</p>
                <p class="subtitle">FUNCTION</p>
              </a>
            </div>
          </article>
        </div>
EOF
)
    echo "$box"         \
    | sed "s/SHORTNAME/$1/"  \
    | sed "s/NAME/$2/"  \
    | sed "s/FUNCTION/$3/" \
    | sed "s/LINK/$4/"
}
#make_box bfdi "Ulrich Kelber" "Bundesbeauftragter für den Datenschutz und die Informationsfreiheit" "https:\/\/www.bfdi.bund.de"

make_box katta "Katharina Nocun" "Netzaktivistin \& Buchautorin" "https:\/\/kattascha.de"

make_box rainer "Rainer Rehak" "Stellv. Vorsitzender des Forum InformatikerInnen für Frieden \& gesellschaftliche Verantwortung" "https:\/\/www.weizenbaum-institut.de\/portrait\/p\/rainer-rehak\/"

#make_box constanze "Constanze Kurz" "Sprecherin des Chaos Computer Clubs" "https:\/\/ccc.de"

make_box ulf "Ulf Buermeyer" "Vorsitzender der Gesellschaft für Freiheitsrechte" "https:\/\/freiheitsrechte.org"

make_box markus "Markus Beckedahl (2020)" "Gründer re:publica \& netzpolitik.org" "https:\/\/twitter.com\/netzpolitik"

#make_box konstantin "Konstantin von Notz" "Bundestagsfraktion Bündnis 90 \/ Die Grünen" "https:\/\/www.von-notz.de"

#make_box anke "Anke Domscheit-Berg" "Netzpolitische Sprecherin der Linksfraktion im Bundestag" "https:\/\/twitter.com\/anked"

make_box thomas "Thomas Lohninger" "Geschäftsführer von epicenter.works" "https:\/\/socialhack.eu"

make_box andreas "Andreas Eschbach" "Buchautor" "https:\/\/www.andreaseschbach.de"

cat <<EOF

      </div>
    </section>
EOF
