# Grading Rubric & Self-Assessment

Use this for self-paced study or as an instructor rubric if Byte
Fortress Learn runs this as a cohort course. Each module is scored out
of 10.

## Per-module scoring (0-10)

| Criterion | Points | What it looks for |
|---|---|---|
| Concept understanding | 0-3 | Learner can explain *why* the vulnerability exists in their own words, not just reproduce steps. Written explanation required in their submitted `NOTES.md`. |
| Correct implementation | 0-3 | `template.c` compiles under the module's expected protection profile (verified via `tools/checksec.sh`) and exhibits the intended vulnerability class when tested with a benign, non-malicious oversized input (e.g. confirms a crash / unexpected behavior occurs — not a full exploit). |
| Guided practice completion | 0-2 | Evidence the learner completed the paired external-resource challenge (e.g. a written walkthrough in their own words, screenshot of the challenge's "solved" output — no exploit code needs to be submitted here, just proof of completion and a summary of the technique). |
| Remediation write-up | 0-2 | Learner identifies at least one concrete fix (e.g. bounds checking, safe function substitution, compiler flag, canary/ASLR/NX enablement) and explains why it would prevent the issue. |

**Passing threshold:** 7/10 per module to advance, though this is
self-paced — the real goal is understanding, not the score.

## What to submit per module (self-tracking or instructor review)

1. Your own `template.c` implementation (not committed to the public
   repo if it contains a working vulnerability with no fix -- keep
   personal exercise solutions in a private fork or local-only branch).
2. A `NOTES.md` per module covering:
   - What the vulnerability is and why it occurs
   - What protections were disabled/enabled and why (per
     `checksec.sh` output)
   - A summary (not code) of how the paired external-resource
     challenge was solved
   - The remediation you'd apply in production code
3. `checksec.sh` output for your compiled binary.

## Capstone (module 16) rubric addition

- Combines at least two techniques from prior modules (e.g. a format
  string leak used to defeat ASLR, followed by a ROP chain).
- Full write-up covering the chain end-to-end conceptually.
- A remediation section addressing each technique used.

## Instructor notes (if run as a cohort)

- Never require or accept submission of working exploit scripts as
  part of grading — grade the write-up and the `checksec` evidence,
  not a functioning payload.
- Encourage pair review: two learners explaining a vulnerability to
  each other is often a better signal of understanding than a solo
  write-up.
