import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : ℝ
  specificity : ℝ
  positiveLikelihoodRatio : ℝ
  negativeLikelihoodRatio : ℝ
  diseasePrevalence : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  likelihoodFormulasCorrect : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestPackage) where
  sensitivityClosed : D.sensitivity > 0 ∧ D.sensitivity < 1
  specificityClosed : D.specificity > 0 ∧ D.specificity < 1
  likelihoodFormulasCorrectClosed : D.likelihoodFormulasCorrect

def DiagnosticTestClosed (D : DiagnosticTestPackage) : Prop :=
  (D.sensitivity > 0 ∧ D.sensitivity < 1) ∧
  (D.specificity > 0 ∧ D.specificity < 1) ∧
  D.likelihoodFormulasCorrect

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestPackage)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed E.likelihoodFormulasCorrectClosed)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse