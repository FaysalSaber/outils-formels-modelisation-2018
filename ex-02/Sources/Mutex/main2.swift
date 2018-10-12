private func pre(p: Place, t: Transition) -> Nat {
  switch (p, t) {
  case (Place("s0"), Transition("t0")): return 1
  case (Place("s1"), Transition("t1")): return 1
  case (Place("s2"), Transition("t2")): return 1
  case (Place("s3"), Transition("t3")): return 1
  case (Place("s4"), Transition("t0")): return 1
  case (Place("s4"), Transition("t2")): return 1
  case (Place("b"), Transition("t2")): return 1
  case (Place("c"), Transition("t0")): return 1
  default: return 0
  }
}

private func post(p: Place, t: Transition) -> Nat {
  switch (p, t) {
  case (Place("s0"), Transition("t1")): return 1
  case (Place("s1"), Transition("t0")): return 1
  case (Place("s2"), Transition("t3")): return 1
  case (Place("s3"), Transition("t2")): return 1
  case (Place("s4"), Transition("t1")): return 1
  case (Place("s4"), Transition("t3")): return 1
  case (Place("b"), Transition("t0")): return 1
  case (Place("c"), Transition("t2")): return 1
  default: return 0
  }
}

func initialMarking(_ place: Place) -> Nat {
  switch place {
  case Place("s0"): return 1
  case Place("s2"): return 1
  case Place("s4"): return 1
  case Place("c"): return 3
  default: return 0
  }
}

let model = PetriNet(
  places     : [Place("s0"), Place("s1"), Place("s2"), Place("s3"), Place("s4"), Place("b"), Place("c")],
  transitions: [Transition("t0"), Transition("t1"), Transition("t2"), Transition("t3S")],
  pre        : pre,
  post       : post)


print(initialMarking(Place("s2"))) // va sortir le marquage initial de la place p2
//vecteur caractéristique = [1,1,2] si on fait t1->t3->t2->t3 dans ce cas


let c  = model.incidenceMatrix
let s  = model.characteristicVector(of: [Transition("t0"), Transition("t1"), Transition("t0")])
let m0 = model.markingVector(initialMarking)
let m1 = m0 + c * s

print(m0, m1)
