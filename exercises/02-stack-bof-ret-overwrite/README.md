# Module 02 — Stack BOF — Return Address Overwrite

## Objective

Understand how a large enough stack overflow can reach and overwrite the saved return address, redirecting control flow when the function returns.

## What to build in `template.c`

Write a program with a vulnerable fixed-size buffer as in module 01, plus a second function (e.g. named win()) that is never called from main(). The exercise is to reason about the stack layout needed to reach the return address, not to write the redirect yourself here.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**exploit.education Protostar — stack3 and stack4**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output none
```

## Acceptance criteria

checksec confirms no canary, no PIE, executable stack. Use gdb to disassemble your binary and confirm the offset from the buffer to the saved return address (document this in NOTES.md, no exploit required in this repo).

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
