venv: venv/bin/activate

venv/bin/activate: requirements.txt
	test -d venv || virtualenv venv ;\
	venv/bin/pip install -Ur requirements.txt ;\
	touch venv/bin/activate ;\
	echo $(PWD) > venv/lib/python3.7/site-packages/thisproject.pth

sftp-fake:
	rsync -anv --exclude-from=".syncignore" $(PWD) lame23:/home/infres/dkiedanski
sftp:
	rsync -av --exclude-from=".syncignore" $(PWD) lame23:/home/infres/dkiedanski