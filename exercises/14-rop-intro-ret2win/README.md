# Module 14 — NX/DEP Bypass — Intro to ROP

## Objective

Understand why, once shellcode injection is blocked by NX, attackers instead chain together existing executable code fragments ('gadgets') already present in the binary.

## What to build in `template.c`

No new template.c for this module -- this module is entirely guided practice against the external resource. Use this module's NOTES.md to document your process.

Remember: keep your completed (vulnerable) version out of this public
repository. Work on it locally or in a private fork. Only the bare
skeleton belongs here.

## Guided exploitation practice

Once your own `template.c` demonstrates the concept, go practice the
full exploitation technique against a real, purpose-built target here:

**ROP Emporium — ret2win challenge, https://ropemporium.com/**

This is where the actual "make it break, then break it" hands-on
exploitation happens, on infrastructure designed and maintained by
that project.

## Expected protection profile

Build with:

```bash
../../tools/build.sh template.c template_output full
```

## Acceptance criteria

Written walkthrough (technique summary, not exploit code) of how you identified the offset to the return address and the target function's address using objdump/nm/gdb.

## Validate your build

```bash
./validate.sh template_output
```

## What to submit / document

See `docs/grading-rubric.md` in the repo root. At minimum, write a
`NOTES.md` in this folder (not committed with any working exploit
code) covering what you learned and how the external resource
challenge was solved, in your own words.
