# Module 01 — Stack Buffer Overflow — Basics

## Objective

Understand how an unbounded copy into a fixed-size stack buffer (e.g. via gets() or unchecked strcpy()) can overwrite adjacent stack memory, such as a neighboring variable.

## What to build in `template.c`

Write a program with a fixed-size local char buffer and at least one other local variable declared after it. Read input into the buffer using a function with no bounds checking. Print whether the other variable's value changed from its initial value.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — stack0 through stack2 (https://exploit.education/protostar/)**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output none
```

## Acceptance criteria

Binary compiles with protections disabled (checksec shows no canary, executable stack, no PIE). Program crashes or shows an unexpected value when given an oversized input (confirm with a long but clearly non-malicious string of repeated characters, e.g. 200 'A's).

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
