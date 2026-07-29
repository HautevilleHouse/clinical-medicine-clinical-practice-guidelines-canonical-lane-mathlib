import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure MetaAnalysisPackage where
  studies : List (ℝ × ℝ)
  heterogeneityTest : ℝ
  pooledEffectSize : ℝ
  confidenceInterval : ℝ × ℝ
  modelValid : Prop
  publicationBiasNotSignificant : Prop

structure MetaAnalysisEvidence (M : MetaAnalysisPackage) where
  modelValidClosed : M.modelValid
  publicationBiasNotSignificantClosed : M.publicationBiasNotSignificant

def MetaAnalysisClosed (M : MetaAnalysisPackage) : Prop :=
  M.modelValid ∧ M.publicationBiasNotSignificant

theorem meta_analysis_closed_from_evidence (M : MetaAnalysisPackage)
    (E : MetaAnalysisEvidence M) : MetaAnalysisClosed M := by
  exact And.intro E.modelValidClosed E.publicationBiasNotSignificantClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse