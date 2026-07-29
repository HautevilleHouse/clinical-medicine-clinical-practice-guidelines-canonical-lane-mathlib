import ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

def ConstrainedClinicalGuidelineClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_clinical_guideline_endgame (A : AdmissibleClass) : ConstrainedClinicalGuidelineClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse
