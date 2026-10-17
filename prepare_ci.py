"""Retrieve the already-public proof for verification, without relicensing it."""
from pathlib import Path
import hashlib
import re
import urllib.request

URL = "https://raw.githubusercontent.com/umaia1234/agentic-conjectures/96ea0039d9dc3a1940b9d5ec1cbe616ed58d1da2/problems/erdos-671/upstream/Erdos671.public.lean"
raw = urllib.request.urlopen(URL).read().replace(b"\r\n", b"\n")
assert hashlib.sha256(raw).hexdigest() == "3854ae85aca322b5ad2c65fb9c7bae5ca19ed939ceca99521365d8690b8d8923"
text = raw.decode("utf-8")
imports = "\n".join("public import Mathlib." + name for name in [
    "Topology.ContinuousMap.Weierstrass", "LinearAlgebra.Lagrange",
    "Data.Finset.Sort", "Tactic"])
text = text.replace("import Mathlib\n", "module\n\n" + imports + "\n", 1)
text = text.replace("open ContinuousMap", "@[expose] public section\n\nopen ContinuousMap", 1)
text = text.replace("  letI : LinearOrder (TaggedIndex", "  let : LinearOrder (TaggedIndex")
text = text.replace("  letI : Nonempty (ExteriorBackground k)", "  let : Nonempty (ExteriorBackground k)")
old = "      norm_num [fillerEmbedding, fillerZoneEmbedding] at h'"
text = text.replace(old, "      change (z i : ℝ) = (fillerSource d j' : ℝ) at h'", 1)
text = text.replace(old, "      change (fillerSource d j : ℝ) = (z i' : ℝ) at h'", 1)
text = text.replace("\ntheorem array_lebesgue_unbounded", "\nprivate theorem array_lebesgue_unbounded")
text = text.replace("\nprivate def lagrangeValue ", "\ndef lagrangeValue ")
for old, new in [("if_pos", "ite_eq_left"), ("if_neg", "ite_eq_right"),
                 ("dif_pos", "dite_eq_left"), ("dif_neg", "dite_eq_right")]:
    text = re.sub(r"\b" + old + r"\b", new, text)
text = text.rstrip("\n")
assert hashlib.sha256(text.encode()).hexdigest() == "7afa5e45a37bca458e92faa90880865d3536f3677442a92d60beda806407efad"
Path("Solution.lean").write_text(text, encoding="utf-8", newline="\n")
print("Retrieved original SHA256:", hashlib.sha256(raw).hexdigest())
print("Ported Solution SHA256:", hashlib.sha256(text.encode()).hexdigest())
