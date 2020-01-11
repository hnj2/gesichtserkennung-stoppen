#/bin/bash

cd $(realpath $(dirname $0))

make_box () {
    echo
    cat testimonials-box.html   \
    | sed "s/SHORTNAME/$1/"     \
    | sed "s/NAME/$2/"          \
    | sed "s/FUNCTION/$3/"
    echo
}

cat testimonials-header.html

make_box katta "Katharina Nocun" "Netzaktivistin \& Buchautorin"

make_box rainer "Rainer Rehak" "Stellv. Vorsitzender des Forum InformatikerInnen für Frieden \& gesellschaftliche Verantwortung"

make_box constanze "Constanze Kurz" "Sprecherin des Chaos Computer Clubs"

make_box ulf "Ulf Buermeyer" "Vorsitzender der Gesellschaft für Freiheitsrechte"

make_box markus "Markus Beckedahl" "Gründer re:publica \& netzpolitik.org"

make_box anke "Anke Domscheit-Berg" "Netzpolitische Sprecherin der Linksfraktion im Bundestag"

make_box thomas "Thomas Lohninger" "Geschäftsführer von epicenter.works"

cat testimonials-footer.html
