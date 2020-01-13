generate: 					\
		html/index.html		\
		html/aufruf.html	\
		html/presse.html	\
		html/pm.html		\
		html/action.html

diff:
	@bash ./diff.sh

upload:
	@bash ./upload.sh

html/index.html:							\
	 	templates/header.html				\
		templates/title-large.html			\
		templates/forderungen-kurz.html		\
		templates/.testimonials.html		\
		templates/argumente-kurz.html		\
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

html/presse.html:							\
		templates/header.html				\
		templates/title-small.html			\
		templates/pressemitteilung.html		\
		templates/.testimonials.html		\
		templates/minusspace.html			\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

html/pm.html: html/presse.html
	cp html/presse.html html/pm.html



html/action.html: 							\
		templates/header.html				\
		templates/was-kann-ich-tun.html		\
		templates/.testimonials.html		\
		templates/minusspace.html			\
		templates/.unterstuetzer.html		\
		templates/footer.html
	($(addprefix cat , $(addsuffix ;, $^))) >$@

templates/.testimonials.html:	templates/testimonials.sh
	templates/testimonials.sh >templates/.testimonials.html


templates/.unterstuetzer.html: templates/unterstuetzer.sh
	templates/unterstuetzer.sh >templates/.unterstuetzer.html
