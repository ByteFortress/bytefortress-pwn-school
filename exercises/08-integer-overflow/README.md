# Module 08 — Integer Overflow → Buffer Overflow

## Objective

Understand how signed/unsigned integer wraparound in a size calculation can cause an undersized allocation, leading to a subsequent buffer overflow.

## What to build in `template.c`

Write a program that calculates a buffer size from user input (e.g. a count multiplied by an element size) and allocates memory based on that calculation, without validating for overflow.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**SEED Labs — Buffer Overflow Lab (integer overflow variant); pwn.college Memory Errors track**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

NOTES.md documents a specific input that would cause the size calculation to wrap around, and what the consequence would be for a subsequent write into the resulting buffer.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
