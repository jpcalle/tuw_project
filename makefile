file_dep := guessinggame.sh

all: README.md

README.md: $(file_dep)
	touch $@
	echo "# Bash, Make, Git and GitHub Project\n" > $@
	echo "Last make run: " $$(date "+%Y-%m-%d %H:%M:%S") >> $@
	echo "Number of lines in $(file_dep): $$(cat $(file_dep) | wc -l)" >> $@

clean:
	rm -f README.md
