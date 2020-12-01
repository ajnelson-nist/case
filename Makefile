#!/usr/bin/make -f

# This software was developed at the National Institute of Standards
# and Technology by employees of the Federal Government in the course
# of their official duties. Pursuant to title 17 Section 105 of the
# United States Code this software is not subject to copyright
# protection and is in the public domain. NIST assumes no
# responsibility whatsoever for its use by other parties, and makes
# no guarantees, expressed or implied, about its quality,
# reliability, or any other characteristic.
#
# We would appreciate acknowledgement if the software is used.

all:

.lib.done.log:
	$(MAKE) \
	  --directory lib
	touch $@

# STORY: Each ontology file (/ontology/*.ttl) needs to be confirmed
#        to have been committed in normalized form, via the directions
#        specified in /NORMALIZING.md.
#
# GIVEN: Normalization software is downloaded, via directions in the
#        /lib directory;
# WHEN:  A user edits an ontology file;
# THEN:  The edited ontology file is run through the normalization
#        process to check syntax and apply formatting, creating an
#        exemplar file for comparing against the edited file.
#        Any differences are reported as an error.
check: \
  .lib.done.log
	$(MAKE) \
	  --directory ontology \
	  check

clean:
	@rm -f .lib.done.log
	@$(MAKE) \
	  --directory ontology \
	  clean
