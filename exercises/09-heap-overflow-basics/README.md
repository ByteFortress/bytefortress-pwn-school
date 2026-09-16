# Module 09 — Heap Overflow — Basics

## Objective

Understand how writing past the end of a heap-allocated buffer can corrupt adjacent heap metadata or neighboring chunks.

## What to build in `template.c`

Write a program that allocates two buffers with malloc() and writes past the end of the first one using unchecked input.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — heap0 and heap1**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

Demonstrate (via a benign oversized write, not a crafted exploit) that data intended for the second buffer or its metadata region changes when the first buffer is overflowed.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
