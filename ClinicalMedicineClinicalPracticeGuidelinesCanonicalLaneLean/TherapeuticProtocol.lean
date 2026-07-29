import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure TherapeuticProtocolPackage where
  drugDose : ℝ
  dosingInterval : ℝ
  therapeuticWindowLow : ℝ
  therapeuticWindowHigh : ℝ
  doseInWindow : Prop
  efficacyEstablished : Prop
  safetyEstablished : Prop

structure TherapeuticProtocolEvidence (T : TherapeuticProtocolPackage) where
  doseInWindowClosed : T.doseInWindow
  efficacyEstablishedClosed : T.efficacyEstablished
  safetyEstablishedClosed : T.safetyEstablished

def TherapeuticProtocolClosed (T : TherapeuticProtocolPackage) : Prop :=
  T.doseInWindow ∧ T.efficacyEstablished ∧ T.safetyEstablished

theorem therapeutic_protocol_closed_from_evidence (T : TherapeuticProtocolPackage)
    (E : TherapeuticProtocolEvidence T) : TherapeuticProtocolClosed T := by
  exact And.intro E.doseInWindowClosed
    (And.intro E.efficacyEstablishedClosed E.safetyEstablishedClosed)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse