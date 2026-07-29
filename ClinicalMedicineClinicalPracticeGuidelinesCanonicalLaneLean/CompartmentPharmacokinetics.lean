import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure CompartmentModel where
  numCompartments : Nat
  rateConstants : Type u
  drugMass : Type v
  initialConditions : Prop
  differentialEquations : Prop
  analyticSolution : Prop

structure CompartmentModelEvidence (M : CompartmentModel) where
  initialConditionsClosed : M.initialConditions
  differentialEquationsClosed : M.differentialEquations
  analyticSolutionClosed : M.analyticSolution

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.initialConditions ∧ M.differentialEquations ∧ M.analyticSolution

theorem compartment_model_closed_from_evidence (M : CompartmentModel)
    (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.initialConditionsClosed
    (And.intro E.differentialEquationsClosed E.analyticSolutionClosed)

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse