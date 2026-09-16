# Byte Fortress Pwn School — Binary Exploitation Fundamentals

Part of the **Byte Fortress Learn** open project: a free, open-source,
professional-development curriculum on memory corruption and binary
exploitation, built for Linux and C.

> ⚠️ **Read [DISCLAIMER.md](DISCLAIMER.md) before doing anything else.**
> This repository is for educational and ethical research purposes only,
> on systems you own or are explicitly authorized to test. You must
> accept the terms in `DISCLAIMER.md` before working through any exercise.

## What this is

This is a guided learning path, not a vulnerability dump. Each module:

1. Teaches a concept (stack buffer overflow, canary bypass, format
   string bugs, heap corruption, ASLR/DEP defeat, intro ROP, etc.)
2. Points you to a well-established, vetted open-source exercise where
   you practice against a real vulnerable binary (Protostar, ROP
   Emporium, SEED Labs, Exploit Education, pwn.college — see each
   module's README for the specific link).
3. Gives you a **skeleton `template.c`** where *you* write your own
   vulnerable program implementing that week's concept, as a
   professional-development exercise in recognizing insecure code by
   writing it yourself.
4. Gives you a `validate.sh` script that checks your binary's
   *structure and protection flags* (via `checksec`) — it does not
   contain or perform an exploit for you.

## Why it's built this way

Writing a deliberately vulnerable C program and a working exploit for
it — even for teaching — is the same artifact as a ready-to-use attack
tool. This project deliberately keeps that responsibility with you,
the learner, on your own machine, under your own disclaimer
acceptance. The scaffolding, sequencing, tooling, and assessment
around that are original Byte Fortress Learn content; the vulnerable
code you write is yours, and the deep-dive exploitation practice
happens inside established, purpose-built teaching platforms that
already do that part well.

## Repository structure

```
bytefortress-pwn-school/
├── README.md                  ← you are here
├── DISCLAIMER.md               ← required reading + acceptance gate
├── LICENSE
├── CONTRIBUTING.md
├── docs/
│   ├── curriculum-map.md       ← full module list, sequencing, external links
│   ├── vm-setup-guide.md       ← Linux VM + toolchain setup
│   └── grading-rubric.md       ← self-assessment / instructor rubric
├── tools/
│   ├── accept-disclaimer.sh    ← CLI acceptance gate, logs acceptance
│   ├── checksec.sh             ← wraps checksec, explains each flag
│   ├── setup-gdb-pwndbg.sh     ← GDB + pwndbg environment setup
│   └── build.sh                ← compiles your template.c with chosen protection flags
└── exercises/
    ├── 01-stack-bof-basics/
    ├── 02-stack-bof-ret-overwrite/
    ├── ...
    └── 16-capstone-chained/
        ├── README.md            ← objectives, external resource link, what to build
        ├── template.c           ← bare skeleton, no vulnerability-relevant logic
        └── validate.sh          ← structural / checksec validation only
```

## Getting started

1. Read and accept `DISCLAIMER.md`:
   ```bash
   ./tools/accept-disclaimer.sh
   ```
2. Set up your VM/toolchain: see `docs/vm-setup-guide.md`.
3. Read `docs/curriculum-map.md` and start at module 01.
4. In each module folder, read that module's `README.md` first — it
   tells you what concept to implement in `template.c` and which
   external resource to use for guided exploitation practice.
5. Build with `tools/build.sh`, check protections with
   `tools/checksec.sh`, validate structure with the module's
   `validate.sh`.

## Contributing

See `CONTRIBUTING.md`. Pull requests should follow the existing
pattern: concept explainer + external resource link + non-vulnerable
skeleton + validation script. PRs that include working exploit code or
complete vulnerable reference implementations will not be merged — see
`CONTRIBUTING.md` for why and what we accept instead.

## License

Licensed under **CC BY-SA 4.0** — free to use, fork, and remix
(including commercially), as long as you give credit and keep
derivative works open under the same license. See `LICENSE`.
