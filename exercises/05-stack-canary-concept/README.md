# Module 05 — Stack Canary — Concept & Defeat Conditions

## Objective

Understand how the stack protector inserts a canary value before the saved return address, and the specific conditions (e.g. an information leak revealing the canary) under which canary protection can be bypassed.

## What to build in `template.c`

Write two versions of a similar vulnerable-buffer program: one compiled with the stack protector enabled, one with it disabled. Compare their behavior when given oversized input.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**pwn.college — Memory Errors / stack protector modules, https://pwn.college/**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output canary-only
```

## Acceptance criteria

checksec shows canary present on one binary and absent on the other. NOTES.md explains what specific additional primitive (e.g. an arbitrary read to leak the canary value) would be required to defeat the protected version -- conceptual explanation only.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
