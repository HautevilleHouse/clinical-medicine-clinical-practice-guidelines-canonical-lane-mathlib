import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure EvidenceSynthesisPackage where
  systematicReview : Prop
  metaAnalysis : Prop
  heterogeneityAssessment : Prop
  publicationBiasAssessment : Prop
  qualityOfEvidence : Prop
  strengthOfRecommendation : Prop

structure EvidenceSynthesisEvidence (E : EvidenceSynthesisPackage) where
  systematicReviewClosed : E.systematicReview
  metaAnalysisClosed : E.metaAnalysis
  heterogeneityAssessmentClosed : E.heterogeneityAssessment
  publicationBiasAssessmentClosed : E.publicationBiasAssessment
  qualityOfEvidenceClosed : E.qualityOfEvidence
  strengthOfRecommendationClosed : E.strengthOfRecommendation

def EvidenceSynthesisClosed (E : EvidenceSynthesisPackage) : Prop :=
  E.systematicReview ∧ E.metaAnalysis ∧ E.heterogeneityAssessment ∧
  E.publicationBiasAssessment ∧ E.qualityOfEvidence ∧ E.strengthOfRecommendation

theorem evidence_synthesis_closed_from_evidence (E : EvidenceSynthesisPackage) (Ev : EvidenceSynthesisEvidence E) :
    EvidenceSynthesisClosed E := by
  refine And.intro Ev.systematicReviewClosed (And.intro Ev.metaAnalysisClosed
    (And.intro Ev.heterogeneityAssessmentClosed (And.intro Ev.publicationBiasAssessmentClosed
      (And.intro Ev.qualityOfEvidenceClosed Ev.strengthOfRecommendationClosed))))

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse