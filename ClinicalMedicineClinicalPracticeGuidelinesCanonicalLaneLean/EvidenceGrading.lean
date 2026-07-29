import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure EvidenceGradingPackage where
  studyDesignRank : Nat
  effectSize : ℝ
  confidenceInterval : ℝ × ℝ
  pValue : ℝ
  gradeAssigned : Prop
  recommendationStrength : Prop

structure EvidenceGradingEvidence (E : EvidenceGradingPackage) where
  gradeAssignedClosed : E.gradeAssigned
  recommendationStrengthClosed : E.recommendationStrength

def EvidenceGradingClosed (E : EvidenceGradingPackage) : Prop :=
  E.gradeAssigned ∧ E.recommendationStrength

theorem evidence_grading_closed_from_evidence (E : EvidenceGradingPackage)
    (Ev : EvidenceGradingEvidence E) : EvidenceGradingClosed E := by
  exact And.intro Ev.gradeAssignedClosed Ev.recommendationStrengthClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse