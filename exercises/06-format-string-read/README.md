# Module 06 — Format String — Information Disclosure

## Objective

Understand how passing user-controlled input directly as a printf() format string (instead of as an argument) allows reading arbitrary stack values via specifiers like %x.

## What to build in `template.c`

Write a program that reads a string from the user and passes it directly to printf() as the format argument, with no additional arguments supplied.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — format0 and format1**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

Demonstrate (conceptually, in NOTES.md) what happens when a user supplies format specifiers like %x %x %x as input, and why this leaks stack memory contents.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
