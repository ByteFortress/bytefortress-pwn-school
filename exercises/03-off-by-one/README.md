# Module 03 — Off-by-One Errors

## Objective

Understand how an incorrect loop bound or index (using <= instead of < a buffer length, for example) causes a single-byte overwrite just past the end of a buffer.

## What to build in `template.c`

Write a program that copies a fixed-size string into a buffer using a manual loop with a deliberately incorrect bound condition.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**SEED Labs — Buffer Overflow Attack Lab (Set-UID version), https://seedsecuritylabs.org/**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output canary-only
```

## Acceptance criteria

checksec confirms canary is present. Demonstrate (in NOTES.md, not code) why a single-byte overwrite can still corrupt an adjacent value (e.g. a saved frame pointer's low byte) even with a canary present.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
