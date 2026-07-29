import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure GuidelineItem where
  recommendation : String
  strength : String
  evidenceLevel : String
  citations : List String

structure Guideline where
  title : String
  items : List GuidelineItem
  reviewDate : String
  nextUpdate : String

structure GuidelineEvidence (G : Guideline) where
  itemsNonEmpty : G.items ≠ []
  allItemsHaveStrength : ∀ i ∈ G.items, i.strength ≠ ""
  allItemsHaveEvidenceLevel : ∀ i ∈ G.items, i.evidenceLevel ≠ ""

def GuidelineClosed (G : Guideline) : Prop :=
  G.items ≠ [] ∧ (∀ i ∈ G.items, i.strength ≠ "") ∧ (∀ i ∈ G.items, i.evidenceLevel ≠ "")

theorem guideline_closed_from_evidence (G : Guideline)
    (E : GuidelineEvidence G) : GuidelineClosed G := by
  exact And.intro E.itemsNonEmpty
    (And.intro E.allItemsHaveStrength E.allItemsHaveEvidenceLevel)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse