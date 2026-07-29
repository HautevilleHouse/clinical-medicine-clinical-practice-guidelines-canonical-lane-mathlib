import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure StudyDesignPackage where
  studyType : String
  population : String
  intervention : String
  comparator : String
  outcome : String
  randomization : Prop
  blinding : Prop

structure StudyDesignEvidence (S : StudyDesignPackage) where
  randomizationClosed : S.randomization
  blindingClosed : S.blinding

def StudyDesignClosed (S : StudyDesignPackage) : Prop :=
  S.randomization ∧ S.blinding

theorem study_design_closed_from_evidence (S : StudyDesignPackage) (E : StudyDesignEvidence S) :
    StudyDesignClosed S := by
  exact And.intro E.randomizationClosed E.blindingClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse