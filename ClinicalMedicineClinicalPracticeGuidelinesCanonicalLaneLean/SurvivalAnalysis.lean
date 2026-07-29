import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : ℝ → ℝ
  survivalFunction : ℝ → ℝ
  proportionalHazards : Prop
  censoringHandled : Prop
  proportionalHazardsTerm : proportionalHazards
  censoringHandledTerm : censoringHandled

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsClosed : S.proportionalHazards
  censoringHandledClosed : S.censoringHandled

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazards ∧ S.censoringHandled

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsClosed E.censoringHandledClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse
