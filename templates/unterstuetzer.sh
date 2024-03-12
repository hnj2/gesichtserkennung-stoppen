#!/bin/sh

cat <<EOF
    <section id="unterstuetzende-section">
      <a class="anchor" name="unterstuetzende"></a>
      <h2>Unterstützende Organisationen</h2>

      <div class="columns is-multiline">
EOF

make_box () {
    box=$(cat <<EOF

        <div class="column is-one-third">
          <article class="card" >
            <div class="card-image">
              <a href="LINK" target="_blank">
                <img src="img/logo/LOGO">
              </a>
            </div>
            <div class="card-content">
              <a href="LINK" target="_blank">
                <p class="title">NAME</p>
              </a>
            </div>
          </article>
        </div>
EOF
)
    echo "$box"         \
    | sed "s/LOGO/$1/"  \
    | sed "s/NAME/$2/"  \
    | sed "s/LINK/$3/"
}

make_box ccc.jpg "Chaos Computer Club e.V." "https:\/\/ccc.de"
make_box aw.png "AlgorithmWatch" "https:\/\/algorithmwatch.org"
make_box ai.png  "Amnesty International e.V." "https:\/\/www.amnesty.de"
make_box dg.jpg  "Digitale Gesellschaft e.V." "https:\/\/digitalegesellschaft.de"
make_box d64.png  "D64 Zentrum für Digitalen Fortschritt e.V." "https:\/\/d-64.org"
make_box ryf.png "ReclaimYourFace" "https:\/\/reclaimyourface.eu"
make_box load.png  "LOAD e.V. Verein für liberale Netzpolitik" "https:\/\/www.load-ev.de"
fiff_long="Forum InformatikerInnen für Frieden und gesellschaftliche Verantwortung e.V."
#make_box fiff.jpg "<span class=\"is-hidden-mobile\">$fiff_long<\/span><span class=\"is-hidden-tablet\">FIfF e.V.<\/span>" "https:\/\/fiff.de"
make_box fiff.jpg "$fiff_long" "https:\/\/fiff.de"
make_box df.svg "Digitale Freiheit e.V." "https:\/\/digitale-freiheit.jetzt"
#make_box dc.png "Digitalcourage e.V." "https:\/\/digitalcourage.de"
make_box hu.jpg "Humanistische Union e.V." "https:\/\/www.humanistische-union.de"
#make_box sd.png "Selbstbestimmt.Digital e.V." "https:\/\/www.selbstbestimmt-digital.de"
make_box topio.jpg "Topio \/\/\/ public space for privacy" "https:\/\/www.topio.info"
#make_box gw.png "Germanwatch" "https:\/\/germanwatch.org"
#make_box gi.svg "Gesellschaft für Informatik" "https:\/\/gi.de"



#make_box "" ""

cat <<EOF

      </div>
    </section>
EOF
