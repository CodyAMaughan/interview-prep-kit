# Fit — Foundry / Backend Software Engineer

## JD reverse-map (their words → your evidence)
| JD requirement (quote it) | Your matching evidence | Match strength |
|---|---|---|
| "3+ years building web applications in production." | ~5 years across Lattice (customer-facing web app) and Cedar & Pine (internal tools); both production web work. | strong |
| "Build and ship features across the stack, with an emphasis on backend services and APIs." | Built features in a customer-facing React/Node app; built internal tools; REST APIs in skills. But résumé reads front-end-heavy; depth of *backend service/API* ownership is unproven. | partial |
| "Proficient with a modern backend stack (Node/TypeScript, Python, Go, or similar) and SQL." | Node.js + TypeScript + SQL all listed and used. Matches the stack named. | strong |
| "A track record of shipping features and owning their quality (testing, code review)." | Owned checkout features + bug fixes (Lattice); wrote tests, improved testing practices, did code review (Cedar & Pine + Lattice). | strong |
| "Own the quality of what you ship: write tests, review code, and improve reliability." | Direct match — testing practice improvement, code reviews, legacy maintenance/migration, incident response. | strong |
| "Collaborate with product and design from idea through launch." | "Collaborated with product managers and designers on the product roadmap" (Lattice). | strong |
| "Participate in on-call and help improve performance and developer experience." | Assisted with on-call + incident response (Cedar & Pine); "helped improve the performance of some slow pages" (Lattice). | partial |
| "Evidence of measurable impact on the products or systems you've worked on." | ⚠️ **GAP** — résumé and intake answers contain **no quantified impact at all**. This is the single most exposed requirement. | **GAP** |
| Nice-to-have: "Front-end experience (React) for full-stack work." | React used at Lattice; genuinely strong here. | strong |
| Nice-to-have: "Experience improving performance or reliability with before/after results." | Performance work mentioned ("slow pages"), but **no before/after numbers**. | **GAP** |
| Nice-to-have: "AWS or another cloud in production." | "some AWS" / "familiar with AWS" — shallow, unspecified. | partial |

## The meta-move (per strong line)
- **3+ years in production** → standard expectation is sustained production ownership; you've done ~5 years across two companies → frame the arc as tooling/migration → customer product, i.e. moving toward backend ownership deliberately.
- **Node/TypeScript + SQL** → the SOTA full-stack backend stack is exactly Node/TS + a SQL store; you've worked in it → be ready to defend a real schema/query and an API you designed (prep this — the evidence is thin in writing).
- **Owning quality (testing/code review)** → the standard is tests + CI + review gates; you improved a team's testing practices and drove adoption → trade-off to name: you pushed testing culture incrementally (adoption over mandate) rather than enforcing coverage gates top-down. Bring the *number* once you find it.
- **Product/design collaboration** → standard is idea→launch partnership; you worked with PM/design on roadmap → ready-made answer; pick one feature and walk idea→launch.

## GAP map (this drives the plan)
| Gap | Why it matters for THIS role | Cost to close | Priority |
|---|---|---|---|
| **Zero quantified impact** anywhere | JD explicitly requires "evidence of measurable impact" and "before/after results"; every behavioral story currently dies on "what was the number?" | med (dig up real metrics — analytics, dashboards, PR/incident history; do NOT invent) | 🔴 |
| **Backend/API depth unproven** | Role is backend-*leaning*; résumé reads front-end-heavy. Technical screen + onsite system design will probe service/API/data design. | med | 🔴 |
| **System design** (onsite round) | Onsite explicitly includes system design; no design-scale evidence in materials. | high | 🟠 |
| **SQL fluency for live coding** | "and SQL" is required; technical screen has a live coding problem; current SQL evidence is just a skills-list entry. | low–med | 🟠 |
| **AWS / cloud in production** | Nice-to-have; "familiar" is weak. Could come up onsite. | med | 🟡 |
| **Performance/reliability with before/after** | Nice-to-have and a likely probe given the on-call/perf line; you have the activity, not the numbers. | med (same dig as the impact gap) | 🟡 |

Prioritized by (JD weight) × (current weakness) ÷ (cost): the **quantified-impact gap** is #1 — highest JD weight, total current weakness, and only medium cost (the numbers likely exist; they just haven't been gathered). **Backend/API depth** is #2 for the same reasons. System design and SQL follow because they're tested live but later in the loop.

## Honest framing
This is mostly a **resurfacing + evidence-gathering** job, not learning-from-scratch. The candidate has genuinely done the work the JD describes — full-stack shipping, testing/quality ownership, product collaboration, on-call. The skills aren't missing; the **proof** is. The biggest single risk is not a knowledge gap but a **storytelling gap**: every answer currently ends in "I think it went up, I'd have to check." The honest line for the room: *"I owned X and Y; let me get you the exact numbers"* — and then actually get them before the interview, never invent them. The one area that is closer to genuine new ground is **system design at the onsite**, where the materials show no scale evidence; that's the only track that's real study rather than recall.
