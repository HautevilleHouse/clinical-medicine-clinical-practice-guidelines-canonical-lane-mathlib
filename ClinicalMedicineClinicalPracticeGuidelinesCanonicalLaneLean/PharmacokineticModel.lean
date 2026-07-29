import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure PharmacokineticModelPackage (C : CompartmentModelPackage) where
  absorptionRate : Prop
  bioavailability : Prop
  clearance : Prop
  halfLife : Prop
  concentrationTimeCurve : Prop

structure PharmacokineticModelEvidence {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) where
  absorptionRateClosed : P.absorptionRate
  bioavailabilityClosed : P.bioavailability
  clearanceClosed : P.clearance
  halfLifeClosed : P.halfLife
  concentrationTimeCurveClosed : P.concentrationTimeCurve

def PharmacokineticModelClosed {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) : Prop :=
  P.absorptionRate ∧ P.bioavailability ∧ P.clearance ∧ P.halfLife ∧ P.concentrationTimeCurve

theorem pharmacokinetic_model_closed_from_evidence {C : CompartmentModelPackage} (P : PharmacokineticModelPackage C) (E : PharmacokineticModelEvidence P) :
    PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.bioavailabilityClosed
      (And.intro E.clearanceClosed
        (And.intro E.halfLifeClosed E.concentrationTimeCurveClosed)))

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse