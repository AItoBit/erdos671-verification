module

public import Mathlib.Topology.ContinuousMap.Compact
public import Mathlib.LinearAlgebra.Lagrange

/-!
# The two interpolation questions of Erdős problem 671

There is one triangular array with exactly $n$ distinct interpolation nodes in
$[-1,1]$ in each positive row $n$. Its Lebesgue functions have infinite limsup
at every point. Nevertheless each continuous real function has a point at which
the full sequence of Lagrange interpolants converges to that function.

The stronger, everywhere-unbounded conclusion also answers the first question.
The threshold formulation below means that arbitrarily late rows exceed every
real bound. Row index `n` represents the original row of size `n+1`.

Source: https://www.erdosproblems.com/latex/671 and the supplied 671.pdf.
The Solution reproduces the public proof posted by Liam Price, with attribution
and outstanding permission issues documented outside this statement file.
-/

@[expose] public section

noncomputable section

open ContinuousMap Filter Polynomial Set
open scoped BigOperators Topology

namespace Erdos671

/-- The full closed interval, including both endpoints. -/
abbrev Interval := Set.Icc (-1 : ℝ) 1

/-- Exactly `n` distinct nodes in the interval. -/
structure Row (n : ℕ) where
  ι : Type
  fintypeι : Fintype ι
  decidableEqι : DecidableEq ι
  card_ι : Fintype.card ι = n
  node : ι ↪ Interval

attribute [instance] Row.fintypeι Row.decidableEqι

/-- Evaluation of the standard Lagrange basis for a finite node family. -/
def lagrangeValue {ι : Type*} [Fintype ι] [DecidableEq ι]
    (node : ι → ℝ) (i : ι) (x : ℝ) : ℝ :=
  (Lagrange.basis Finset.univ node i).eval x

/-- The usual fundamental Lagrange polynomial, evaluated at `x`. -/
def fundamental {n : ℕ} (X : Row n) (i : X.ι) (x : ℝ) : ℝ :=
  lagrangeValue (fun j ↦ (X.node j : ℝ)) i x

/-- The Lagrange interpolation polynomial evaluated at `x`. -/
def interpolant {n : ℕ} (X : Row n) (f : C(Interval, ℝ)) (x : ℝ) : ℝ :=
  ∑ i, f (X.node i) * fundamental X i x

/-- The sum of absolute values of the fundamental polynomials. -/
def lebesgue {n : ℕ} (X : Row n) (x : ℝ) : ℝ :=
  ∑ i, |fundamental X i x|

/-- The underlying finite set of distinct nodes. -/
def nodeSet {n : ℕ} (X : Row n) : Finset Interval := Finset.univ.map X.node

/-- Both existence questions in Erdős problem 671 have affirmative answers. -/
theorem erdos_671 :
    ∃ X : ∀ n : ℕ, Row (n + 1),
      (∀ n, (nodeSet (X n)).card = n + 1) ∧
      (∀ x : Interval, ∀ A : ℝ, ∀ N : ℕ,
        ∃ n ≥ N, A ≤ lebesgue (X n) x) ∧
      ∀ f : C(Interval, ℝ), ∃ x : Interval,
        Tendsto (fun n ↦ interpolant (X n) f x) atTop (𝓝 (f x)) ∧
        ∀ A : ℝ, ∀ N : ℕ, ∃ n ≥ N, A ≤ lebesgue (X n) x := by
  sorry

end Erdos671

end
