Erdos 671 independent verification runner

This repository contains a short statement, toolchain pins, and a reproducible
runner. It does not distribute the original full proof or claim its authorship.
The runner retrieves the existing public payload at an immutable commit and
checks its SHA256 before making the documented module-system compatibility port.

Original argument: GPT Pro, under Liam Price's direction, as credited by the
public proof claim. Original Lean formalization: GPT-5.5 in Codex, according to
the same claim. Current work: reproduction, compatibility port, statement
comparison, axiom inspection, and mechanical verification, using Codex.
No mathematical novelty, author approval, or registry acceptance is asserted.

Original claim: https://www.erdosproblems.com/forum/thread/671/proof-claims
Source provenance:
https://github.com/umaia1234/agentic-conjectures/blob/96ea0039d9dc3a1940b9d5ec1cbe616ed58d1da2/problems/erdos-671/upstream/README.md

The original payload has no stated reuse license. Its licensing and submission
authorization remain unresolved. No license for that proof is created by this
runner. Do not treat this repository as a Palomar submission or as the
substantive proof repository. The Solution is generated transiently by CI and
excluded from Git; only verification logs are retained.

Comparator is run with actual Bubblewrap isolation, Lean's kernel, and the
NanoDa and con-ron bundled with the pinned Lean toolchain, as selected by the
current Palomar profile. No fake sandbox or
--inadvisably-no-sandbox option is used. This comparison does not replace
Palomar's complete mechanical preflight, which additionally checks a licensed,
public source snapshot, metadata, canonical dependencies, source provenance,
and resource measurements.

The manual "Palomar full mechanical preflight" workflow is also installed.
It calls the complete official workflow with mode=full and profile
palomar-standard-v1, with both the workflow reference and pipeline_commit pinned
to d4e41c1d5b0d114c4859e6e5831dc6d3ad1d0d44. Supply a public, licensed proof
repository, its immutable commit and optional project paths once those exist.
The verification runner itself is not an eligible substitute for that source.
Only a resulting official mechanical report with status=pass completes that
preflight. This workflow has not been dispatched for the unresolved-license
proof and does not assert any person's authorization relationship.
