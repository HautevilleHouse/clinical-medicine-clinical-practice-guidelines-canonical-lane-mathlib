import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Nat
  transferRates : Vector ℝ (compartments * compartments)
  initialConditions : Vector ℝ compartments
  wellDefined : Prop
  wellDefinedTerm : wellDefined

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  wellDefinedClosed : C.wellDefined

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.wellDefined

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact E.wellDefinedClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse
