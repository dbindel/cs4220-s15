# Roster maintenance

This class has three different course numbers: CS 4220, CS 5223, and
MATH 4260.  Peoplesoft does not make it simple to extract and combine
the roster information, let alone to use that information to populate
Piazza or our CMS.  The protocol is:

- Download the "Excel" versions from facultycenter
- Run `make` to generate `roster.txt` and a list of changes
- Manually adjust Piazza and CMS as needed

Note that only the Makefile and the scripts can go into the repository!
