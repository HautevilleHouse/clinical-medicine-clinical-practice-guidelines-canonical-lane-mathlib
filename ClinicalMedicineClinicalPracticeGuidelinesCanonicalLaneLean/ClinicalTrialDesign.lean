import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  randomizationScheme : Prop
  blindingMethod : Prop
  sampleSizeCalculation : Prop
  primaryEndpoint : Prop
  secondaryEndpoints : Prop
  statisticalAnalysisPlan : Prop

structure ClinicalTrialDesignEvidence (T : ClinicalTrialDesignPackage) where
  randomizationSchemeClosed : T.randomizationScheme
  blindingMethodClosed : T.blindingMethod
  sampleSizeCalculationClosed : T.sampleSizeCalculation
  primaryEndpointClosed : T.primaryEndpoint
  secondaryEndpointsClosed : T.secondaryEndpoints
  statisticalAnalysisPlanClosed : T.statisticalAnalysisPlan

def ClinicalTrialDesignClosed (T : ClinicalTrialDesignPackage) : Prop :=
  T.randomizationScheme ∧ T.blindingMethod ∧ T.sampleSizeCalculation ∧
  T.primaryEndpoint ∧ T.secondaryEndpoints ∧ T.statisticalAnalysisPlan

theorem clinical_trial_design_closed_from_evidence (T : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence T) :
    ClinicalTrialDesignClosed T := by
  refine And.intro E.randomizationSchemeClosed (And.intro E.blindingMethodClosed
    (And.intro E.sampleSizeCalculationClosed (And.intro E.primaryEndpointClosed
      (And.intro E.secondaryEndpointsClosed E.statisticalAnalysisPlanClosed))))

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse