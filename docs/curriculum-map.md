# Curriculum Map — Binary Exploitation Fundamentals

16 modules, sequenced from basic stack overflows to a chained
capstone. Each module folder (`exercises/NN-name/`) contains:

- `README.md` — concept objective, what to build in `template.c`,
  which external resource to practice guided exploitation against,
  and acceptance criteria.
- `template.c` — bare skeleton, no vulnerability-relevant logic.
- `validate.sh` — checks your build's structure/protection flags only.

External resources referenced below are independent, long-standing,
widely-used open-source security education platforms. They are not
maintained by Byte Fortress Learn — verify current URLs and challenge
names before each session, as these projects evolve.

| # | Module | Core concept | Primary external resource |
|---|--------|---------------|---------------------------|
| 01 | Stack BOF Basics | Unbounded copy (`gets`/`strcpy`) overwriting adjacent stack memory | [exploit.education](https://exploit.education/protostar/) — Protostar `stack0`–`stack2` |
| 02 | Stack BOF — Return Address Overwrite | Overwriting the saved return address to redirect execution | Protostar `stack3`–`stack4` |
| 03 | Off-by-One Errors | Loop bound / index errors causing single-byte overwrites | [SEED Labs](https://seedsecuritylabs.org/) — Buffer Overflow Attack Lab (Set-UID) |
| 04 | Shellcode Injection Concept | Executing injected code on a non-protected stack (NX disabled) | Protostar `stack5`–`stack6` |
| 05 | Stack Canary — Concept & Defeat Conditions | How `__stack_chk_fail` detects corruption, and the conditions under which it can be bypassed (info leak) | [pwn.college](https://pwn.college/) — Memory Errors / stack protector modules |
| 06 | Format String — Information Disclosure | Using `%x`/`%s` in an uncontrolled format string to read stack memory | Protostar `format0`–`format1` |
| 07 | Format String — Arbitrary Write | Using `%n` to write to arbitrary memory | Protostar `format2`; SEED Labs Format String Attack Lab |
| 08 | Integer Overflow → Buffer Overflow | Signed/unsigned integer wraparound leading to undersized allocations | SEED Labs Buffer Overflow Lab (integer-overflow variants); pwn.college Memory Errors |
| 09 | Heap Overflow — Basics | Overwriting heap metadata/adjacent chunks | Protostar `heap0`–`heap1` |
| 10 | Heap Overflow — Function Pointer Overwrite | Corrupting a heap-stored function pointer to redirect execution | Protostar `heap2` |
| 11 | Use-After-Free (Concept) | Dangling pointer reuse after `free()` | pwn.college Heap Exploitation track |
| 12 | Double Free (Concept) | Corrupting allocator metadata via repeated `free()` | pwn.college Heap Exploitation track |
| 13 | Defeating ASLR via Info Leak | Using a leaked address to compute a base address at runtime | ROP Emporium prerequisites; pwn.college ASLR modules |
| 14 | NX/DEP Bypass — Intro to ROP | Chaining existing code ("gadgets") instead of injecting shellcode | [ROP Emporium](https://ropemporium.com/) — `ret2win` |
| 15 | Return-to-libc & Extended ROP | Calling existing libc functions (e.g. `system()`) via a crafted stack | ROP Emporium `split`, `callme`, `write4`, `badchars`, `fluff`, `pivot`, `ret2csu` |
| 16 | Capstone — Chained Exploit | Learner designs a program requiring 2+ chained techniques from prior modules | Learner's own design + any prior external resource as reference |

## A note on SEH

Structured Exception Handling (SEH) is a **Windows-specific** exception
handling mechanism, exploited via overwriting an exception handler
record on the stack. It does not have a direct equivalent on Linux,
which is why it isn't a numbered module in this Linux/C-focused
curriculum. If you want SEH-specific content, treat it as an optional
Module 17 using a Windows VM and a resource such as [Exploit
Education — "phoenix"](https://exploit.education/phoenix/) alternatives
or Corelan's classic Windows exploit-writing tutorial series, and flag
it clearly as a Windows-only add-on when you fold it into Byte
Fortress Learn.

## Suggested pacing

- Modules 01–04: one week each, foundational.
- Modules 05–08: one to two weeks each, more conceptually dense.
- Modules 09–12: heap content, one to two weeks each, expect more
  friction here even for experienced learners.
- Modules 13–15: the ROP arc, two to three weeks total, this is where
  most learners feel the difficulty spike.
- Module 16: capstone, open-ended (two to four weeks), self-paced.

## Protection profile per module

Use `tools/build.sh <file> <output> <profile>` — the profile expected
for the *your own template.c* portion of each module is noted in that
module's own README, since it should mirror whatever protection state
the paired external resource challenge uses.
