(
cat header.html;
cat title-large.html;
cat forderungen-kurz.html;
cat testimonials.html;
cat argumente-kurz.html;
cat unterstuetzer.html;
cat footer.html
) >index.html


(
cat header.html;
cat title-small.html;
cat pmraw.html;
cat testimonials.html;
cat unterstuetzer.html;
cat footer.html
) >pm.html

(
cat header.html;
cat actionraw.html;
cat testimonials.html;
cat unterstuetzer.html;
cat footer.html
) >action.html

(
cat header.html;
cat title-small.html;
cat forderungen-lang.html;
cat unterstuetzer.html;
cat minusspace.html;
cat testimonials.html;
cat footer.html
) >aufruf.html

zip ../html.zip -xr index.html aufruf.html datenschutz.html impressum.html css/styles.css img/* img/gesichter/*
