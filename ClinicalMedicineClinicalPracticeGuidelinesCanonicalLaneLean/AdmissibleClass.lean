import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure ClinicalAdmittedObject where
  studyType : String
  outcomeMeasured : Type
  evidenceLevel : ℕ
  guidelineStrength : String
  conclusion : Prop

structure AdmissibleClass where
  object : ClinicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse
