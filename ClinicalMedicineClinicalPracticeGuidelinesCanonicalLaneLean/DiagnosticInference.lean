import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : ℝ
  specificity : ℝ
  priorPrevalence : ℝ
  posteriorProbability : ℝ
  bayesianConsistent : Prop
  bayesianConsistentTerm : bayesianConsistent

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  bayesianConsistentClosed : D.bayesianConsistent

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.bayesianConsistent

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact E.bayesianConsistentClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse
