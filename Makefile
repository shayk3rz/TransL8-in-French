install: transl8_ui-fr.mo
	install transl8 transl8_ui /usr/local/bin
	which gdialog >/dev/null 2>&1 || install gdialog /usr/local/bin
	grep -q "`cat transl8.services`" /etc/services || cat transl8.services >> /etc/services
	install transl8.xinetd /etc/xinetd.d/transl8
	ln -sf /usr/local/bin/transl8_ui /usr/local/bin/ntransl8_ui
	install transl8_ui-fr.mo /usr/share/locale/hi/LC_MESSAGES/transl8_ui.mo

transl8_ui.pot: transl8_ui
	xgettext -o transl8_ui.pot -L Shell transl8_ui

transl8_ui-fr.mo: transl8_ui-fr.po
	msgfmt -o transl8_ui-fr.mo transl8_ui-fr.po

clone:
	git clone https://github.com/shayk3rz/TransL8-In-French.git

download:
	git pull

upload:
	git add -A
	git commit
	git push origin 

tags:
	git push origin --tags
