# Module 04 — Shellcode Injection — Concept

## Objective

Understand why an executable stack (NX disabled) allows injected data to be run as code, and why NX is an effective mitigation against this specific technique.

## What to build in `template.c`

Write a program with a vulnerable buffer as in module 01, compiled with the stack marked executable. Do not write or embed shellcode here -- this module's template should only demonstrate the vulnerable copy, not a payload.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — stack5 and stack6**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output none
```

## Acceptance criteria

checksec confirms NX is disabled (executable stack). NOTES.md explains, in your own words, why marking the stack non-executable would break this specific exploitation technique (and why attackers then moved to return-to-libc / ROP -- see modules 14-15).

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
