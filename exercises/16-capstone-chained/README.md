# Module 16 — Capstone — Chained Exploit

## Objective

Design and reason through a program requiring at least two chained techniques from prior modules (e.g. a format-string leak used to defeat ASLR, followed by a ROP chain).

## What to build in `template.c`

Design your own vulnerable program combining two or more classes of bug from modules 01-15. This is open-ended -- there is no single template.c for this module.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**Your choice, informed by any prior module's external resource.**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

A complete NOTES.md write-up covering: the vulnerability chain design, why each stage is necessary, and a remediation section addressing every technique used.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
