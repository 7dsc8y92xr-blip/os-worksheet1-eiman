# Copilot instructions for this repository

This repository is a small OS/assembly worksheet containing 32-bit x86 assembly helpers and a C driver. The goal of these notes is to help an AI coding agent become productive quickly in this codebase.

Summary
- Project type: educational OS/assembly worksheet (x86, 32-bit).
- Language mix: NASM-style assembly (`.asm`) and C (`driver.c`).
- Key runtime shape: a tiny C program (`driver.c`) calls an assembly entry point `asm_main` implemented in assembly files.

Key files
- `src/driver.c` — simple C entry that calls `asm_main`.
- `src/task1.asm` — example worksheet implementation. Defines `global asm_main` and uses `asm_io.inc` helpers.
- `src/asm_io.inc` — macros and `extern` declarations for IO and dump routines used by exercises.
- `src/asm_io.asm` — implementations of `print_int`, `read_int`, `print_char`, `print_nl`, and dump helpers.

Big-picture architecture and conventions
- One small binary: C runtime (driver) + assembly objects. The C side calls `asm_main` which is implemented in assembly.
- Assembly follows a 32-bit calling convention (no leading underscores for ELF builds). `asm_io.asm` contains platform conditional macros but this repo targets ELF/Linux (see comments in `asm_io.asm`).
- Assembly functions use `enter/leave` and `pusha/popa` to manage stack/registers; follow this pattern for new functions to stay consistent.
- Use `%include "asm_io.inc"` in exercise files to reuse `print_int`, `print_nl`, `read_int`, and the `dump_*` helpers.

Build / run (Linux)
- Requirements: `nasm` and a 32-bit toolchain (`gcc-multilib` or equivalent). On Debian/Ubuntu: `sudo apt-get install nasm gcc-multilib`.
- Example commands (run from repo root):
```bash
# assemble helper and task (ELF/32-bit)
nasm -f elf src/asm_io.asm -o asm_io.o
nasm -f elf src/task1.asm -o task1.o

# compile driver and link (force 32-bit)
gcc -m32 src/driver.c asm_io.o task1.o -o task1

# run
./task1
```
- If you get linker errors about missing 32-bit libraries, ensure `libc6:i386` (or multilib) is installed.

Debugging
- Use `gdb` for native debugging: `gdb -q ./task1`. Because this is 32-bit, you may need `set architecture i386` inside gdb in rare environments.
- To inspect the assembly helper prints/dumps, call the `dump_*` macros from assembly; they use the `printf` family underneath (see `asm_io.asm`).

Developer patterns to follow
- Naming: assembly-exported entry points use `global <name>` (e.g. `global asm_main`). Keep the C prototype `int asm_main(void);` in `driver.c`.
- Register/stack discipline: most examples use `enter`, `pusha`, `popa`, `leave`; preserve this to avoid clobbering the runtime.
- Reuse `asm_io.inc` macros: `dump_regs`, `dump_mem`, `dump_math`, and `dump_stack` are useful for diagnostics.
- Platform conditionals: `asm_io.asm` contains guarded defines for other toolchains (WATCOM, OBJ_TYPE). Do not remove these — they document cross-toolchain behavior.

When changing build or CI
- Add a simple Makefile or small `build.sh` in the project root if you want consistent developer workflows. Keep commands above as the canonical steps.

Notes for the AI agent
- Prefer minimal, targeted edits: examples live in `src/task1.asm` and `src/asm_io.asm` — inspect them before changing calling conventions.
- If adding a new assembly exercise, create a `global` symbol matching what `driver.c` expects or update `driver.c` accordingly.
- Avoid assuming 64-bit; this codebase targets 32-bit x86 semantics and ABI.

If anything in these instructions is unclear or you'd like additional examples (Makefile, CI, or a sample `build.sh`), tell me which you prefer and I'll add it.
