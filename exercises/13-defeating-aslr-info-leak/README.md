# Module 13 — Defeating ASLR via Information Leak

## Objective

Understand how a single leaked pointer or address value can be used to compute the base address of a randomized region (stack, heap, or a loaded library) at runtime.

## What to build in `template.c`

Write a program that (intentionally, for this learning exercise) prints the address of a local or heap variable, and reason about how an attacker with a real information-disclosure bug (like modules 06-07) could use an equivalent leak.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**ROP Emporium prerequisite material; pwn.college ASLR modules**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

NOTES.md shows the fixed offset between the leaked address and a target address of interest, calculated across multiple runs with ASLR enabled.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
