(
cat header.html;
cat forderungen-kurz.html;
cat unterstuetzer.html;
cat footer.html
) >index.html

(
cat header.html;
cat forderungen-lang.html;
cat unterstuetzer.html;
cat footer.html
) >aufruf.html

zip ../html.zip -xr index.html aufruf.html datenschutz.html impressum.html css/styles.css
