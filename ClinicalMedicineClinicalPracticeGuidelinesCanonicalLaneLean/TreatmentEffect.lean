import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure TreatmentEffectPackage where
  riskRatio : ℝ
  oddsRatio : ℝ
  absoluteRiskReduction : ℝ
  numberNeededToTreat : ℝ
  effectEstimatesCorrect : Prop

structure TreatmentEffectEvidence (T : TreatmentEffectPackage) where
  effectEstimatesCorrectClosed : T.effectEstimatesCorrect

def TreatmentEffectClosed (T : TreatmentEffectPackage) : Prop :=
  T.effectEstimatesCorrect

theorem treatment_effect_closed_from_evidence (T : TreatmentEffectPackage)
    (E : TreatmentEffectEvidence T) : TreatmentEffectClosed T := by
  exact E.effectEstimatesCorrectClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse