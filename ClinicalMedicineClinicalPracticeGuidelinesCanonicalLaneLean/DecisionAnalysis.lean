import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean

structure DecisionTreeNode where
  label : String
  children : List DecisionTreeNode
  probability : ℝ
  utility : ℝ
  expectedValue : ℝ

structure DecisionTree where
  root : DecisionTreeNode
  depth : Nat
  leafCount : Nat

structure DecisionTreeEvidence (D : DecisionTree) where
  rootClosed : D.root.expectedValue = List.sum (D.root.children.map (λ c => c.probability * c.utility))
  childrenClosed : ∀ c ∈ D.root.children, c.expectedValue = List.sum (c.children.map (λ g => g.probability * g.utility))

def DecisionTreeClosed (D : DecisionTree) : Prop :=
  D.root.expectedValue = List.sum (D.root.children.map (λ c => c.probability * c.utility)) ∧
  ∀ c ∈ D.root.children, c.expectedValue = List.sum (c.children.map (λ g => g.probability * g.utility))

theorem decision_tree_closed_from_evidence (D : DecisionTree)
    (E : DecisionTreeEvidence D) : DecisionTreeClosed D := by
  exact And.intro E.rootClosed E.childrenClosed

end ClinicalMedicineClinicalPracticeGuidelinesCanonicalLaneLean
end HautevilleHouse