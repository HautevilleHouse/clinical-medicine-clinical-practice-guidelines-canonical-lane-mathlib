import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure ClinicalPracticeGuidelinesPackage where
  recommendationStrength : String
  evidenceQuality : String
  benefitHarmAssessment : Prop
  patientValuesConsidered : Prop
  guidelineValid : Prop

structure ClinicalPracticeGuidelinesEvidence (C : ClinicalPracticeGuidelinesPackage) where
  benefitHarmAssessmentClosed : C.benefitHarmAssessment
  patientValuesConsideredClosed : C.patientValuesConsidered
  guidelineValidClosed : C.guidelineValid

def ClinicalPracticeGuidelinesClosed (C : ClinicalPracticeGuidelinesPackage) : Prop :=
  C.benefitHarmAssessment ∧ C.patientValuesConsidered ∧ C.guidelineValid

theorem clinical_practice_guidelines_closed_from_evidence
    (C : ClinicalPracticeGuidelinesPackage) (E : ClinicalPracticeGuidelinesEvidence C) :
    ClinicalPracticeGuidelinesClosed C := by
  exact And.intro E.benefitHarmAssessmentClosed
    (And.intro E.patientValuesConsideredClosed E.guidelineValidClosed)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse