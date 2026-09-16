# Module 11 — Use-After-Free (Concept)

## Objective

Understand how retaining and dereferencing a pointer after its memory has been freed can lead to reading or writing attacker-influenced data if that memory is reallocated.

## What to build in `template.c`

Write a program that frees a heap allocation, then continues to use the now-dangling pointer for a read or write, without setting it to NULL after the free.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**pwn.college — Heap Exploitation track**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

NOTES.md explains why setting a pointer to NULL immediately after free() is a standard mitigation for this class of bug.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
