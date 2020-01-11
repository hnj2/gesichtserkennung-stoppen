#!/bin/bash

cat <<EOF
    <section class="section hero is-medium is-primary">
      <a class="anchor" name="unterstuetzende"></a>
      <h2 class="title is-2 has-text-centered">Unter&shy;stützende</h2>

      <div class="columns is-multiline">
EOF

make_box () {
    box=$(cat <<EOF

        <div class="column is-half-tablet is-one-third-desktop">
          <div class="whitebox" >
            <a href="LINK" target="_blank">
              <img src="img/logo-KURZ.jpg">
              <p><b>NAME</b></p>
            </a>
          </div>
        </div>
EOF
)
    echo "$box"         \
    | sed "s/KURZ/$1/"  \
    | sed "s/NAME/$2/"  \
    | sed "s/LINK/$3/"
}

make_box chaosknoten "Chaos Computer Club e.V." "https:\/\/ccc.de"
make_box chaosknoten "Chaos Computer Club e.V." "https:\/\/ccc.de"

cat <<EOF

      </div>
    </section>
EOF
