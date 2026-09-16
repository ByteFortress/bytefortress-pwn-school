# Module 07 — Format String — Arbitrary Write

## Objective

Understand how the %n format specifier writes the number of bytes output so far to a supplied address, enabling an arbitrary-write primitive from a format string bug.

## What to build in `template.c`

Extend your module 06 program. Do not implement a %n-based write yourself here -- document conceptually what target you'd choose to overwrite (e.g. a variable's address) and why.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — format2; SEED Labs — Format String Attack Lab**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

NOTES.md explains the difference between %x (read) and %n (write) and why %n-based writes are considered especially dangerous.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
