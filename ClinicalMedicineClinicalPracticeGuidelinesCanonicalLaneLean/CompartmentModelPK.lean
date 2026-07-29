import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  rateConstants : List (Nat × Nat × ℝ)
  initialConditions : List ℝ
  equilibriumReached : Prop
  steadyStateConc : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  equilibriumReachedClosed : C.equilibriumReached
  steadyStateConcClosed : C.steadyStateConc

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.equilibriumReached ∧ C.steadyStateConc

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.equilibriumReachedClosed E.steadyStateConcClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse