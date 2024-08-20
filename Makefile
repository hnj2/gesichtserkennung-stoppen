
#Neue Dateien hier hinzufügen!
generate: 					\
		html/index.html		\
		html/action.html  \
		html/impressum.html \
		html/datenschutz.html

test: generate
	@python3 -m http.server -d html -b 127.0.0.1 8888

diff-neu:
	@bash ./diff.sh neu

upload-neu:
	@bash ./upload.sh neu

diff:
	@bash ./diff.sh

upload:
	@bash ./upload.sh

html/index.html:							\
	 	templates/header.html				\
		templates/title-large.html			\
		templates/forderungen-kurz.html		\
		templates/argumente-lang.html		\
		templates/.testimonials.html		\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/aufruf.html:							\
	 	templates/header.html				\
		templates/title-small.html			\
		templates/argumente-lang.html		\
		templates/forderungen-lang.html		\
		templates/.unterstuetzer.html		\
		templates/minusspace.html			\
		templates/.testimonials.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/impressum.html:							\
	 	templates/header.html				\
		templates/title-small.html			\
		templates/impressum.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/datenschutz.html:							\
	 	templates/header.html				\
		templates/title-small.html			\
		templates/datenschutz.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/presse.html:							\
		templates/header.html				\
		templates/title-small.html			\
		templates/pressemitteilung.html		\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@
html/pm.html: html/presse.html
	cp html/presse.html html/pm.html


html/pressespiegel.html:					\
		templates/header.html				\
		templates/title-small.html			\
		templates/pressespiegel.html		\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/action.html:                         \
		templates/header.html				                   \
		templates/title-small.html			\
		templates/.was-kann-ich-tun.html		\
		templates/.testimonials.html		\
		templates/minusspace.html			\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

templates/.was-kann-ich-tun.html:	templates/was-kann-ich-tun.sh
	$< >$@

templates/.testimonials.html:	templates/testimonials.sh
	templates/testimonials.sh >templates/.testimonials.html


templates/.unterstuetzer.html: templates/unterstuetzer.sh
	templates/unterstuetzer.sh >templates/.unterstuetzer.html
