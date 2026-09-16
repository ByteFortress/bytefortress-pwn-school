# Module 10 — Heap Overflow — Function Pointer Overwrite

## Objective

Understand how corrupting a heap-stored function pointer via an adjacent overflow can redirect execution when that pointer is later called.

## What to build in `template.c`

Write a program with a heap-allocated struct containing a function pointer field, preceded by a fixed-size buffer field in the same struct or an adjacent allocation.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — heap2**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

NOTES.md documents the struct layout and the offset from the buffer to the function pointer field.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
