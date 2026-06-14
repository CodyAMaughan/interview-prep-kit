# Expectations — `ic-to-manager` (Elena Vasquez → Aurora Engineering Manager)

> TDD assertions authored BEFORE any run. Strong IC + informal lead → formal EM.
> Anti-trap: the plan must be ROUND-AWARE for a leadership-weighted loop (NOT a coding gauntlet), and
> must honestly name the formal-management gap without fabricating direct-report experience.

## Difficulty / what this case tests
Round-shape + honest framing. Tests whether the plan front-loads leadership/behavioral prep (the loop is
explicitly leadership-weighted) instead of coding, and whether the formal-management gap is named
honestly while crediting real leadership evidence.

## profile.md — expected
- Headline: 11 yrs, staff/platform, technical leadership + mentoring; acting lead, NOT yet a formal
  manager.
- Evidence inventory: build time 18→6 min across 200+ services, incidents −~40%, ~6 engineers led
  (acting), 2 mentees promoted to senior, 5 mentored.
- Open questions / honesty: no formal reports, no reviews-of-record, no hiring-manager loops — surfaced
  honestly, not glossed.

## fit-*.md — JD-line → expected match strength
| JD line | Expected | Why |
|---|---|---|
| "leading engineering work and growing engineers — formally or as a tech lead stepping up" | **strong** | exactly her profile |
| "strong technical foundation in backend/platform systems" | **strong** | staff platform eng |
| "delivering through a team and aligning stakeholders" | **strong/partial** | led platform rewrite, aligned skip-level |
| "coaching, career development, performance, and hiring" | **partial/GAP** | mentoring yes; formal perf/hiring no |
| "prior formal people-management (direct reports, reviews, hiring as hiring manager)" (nice-to-have) | **GAP** | never held it |

## GAP map — expected
- 🟠/🔴 formal people management: performance management, hiring as hiring manager, headcount. Maps to
  the EM role's core. Framed as the real step-up.
- NOT a coding/technical gap — she's over-qualified technically for an EM IC bar.

## Honest framing — expected
- **Resurfacing leadership she's already been doing informally + learning the formal-management craft.**
  Names the manager-of-record gap explicitly.

## plan.md — expected (CRITICAL: round-awareness)
- The loop is leadership-weighted (HM management philosophy → people-mgmt case → conflict scenario →
  technical direction → values). The plan MUST front-load: behavioral/leadership stories, a management
  philosophy, handling the people-management and conflict cases.
- It must NOT prescribe a heavy coding/LeetCode grind — there is no coding gauntlet in this loop.
  build-stories (leadership archetypes) and research/behavioral prep dominate.

## stories.md — expected archetypes
- Leadership/direction (platform rewrite alignment), Disagreeing-up (headcount-cut pushback with incident
  data), Conflict/coaching (the two-engineer API standoff + coaching the junior), Failure-with-recovery
  (held a system too long → bus factor → delegation lesson).
- Numbers present (18→6 min, −40% incidents). Leadership stories should emphasize people outcomes, not
  just technical wins.

## Red-flag behaviors (any = artifact fail)
- Prescribing heavy coding/algorithm prep for this leadership-weighted loop (round-unaware).
- Fabricating direct-report / formal-management / hiring experience.
- Marking "formal people management / hiring as hiring manager" as strong (rubber-stamping the gap).
- Inventing a metric.

## Pass thresholds
Per artifact: mean ≥ 4/5 across criteria AND no criterion < 3 AND zero red-flags. Fabrication = auto-fail.
The plan's round-awareness is the headline criterion for this persona.
