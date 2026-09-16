# Module 12 — Double Free (Concept)

## Objective

Understand how calling free() twice on the same pointer can corrupt allocator metadata (e.g. free-list structures).

## What to build in `template.c`

Write a program that calls free() twice on the same pointer without any guard against it.

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

NOTES.md documents the allocator's observable behavior (e.g. an abort or corruption message) when the double-free occurs, and what modern allocator mitigations (e.g. tcache double-free checks in current glibc) do to detect this.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
