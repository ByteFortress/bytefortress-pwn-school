# Module 15 — Return-to-libc & Extended ROP

## Objective

Understand how calling existing libc functions (such as system()) via a crafted stack, or chaining multiple gadgets to satisfy a calling convention, extends basic ROP to real-world payloads.

## What to build in `template.c`

No new template.c for this module -- entirely guided practice.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**ROP Emporium — split, callme, write4, badchars, fluff, pivot, ret2csu challenges**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

Written walkthrough per challenge attempted, covering the specific technique each one teaches (per the table in docs/curriculum-map.md).

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
