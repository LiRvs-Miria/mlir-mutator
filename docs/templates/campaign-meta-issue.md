<!-- Fill in this report and post it to the LLVM forum
     (https://discourse.llvm.org) under the `fuzzing-campaign` tag,
     BEFORE filing any issues from the campaign.
     Proposal thread: https://discourse.llvm.org/t/seeking-advice-on-reporting-100-mlir-bugs-found-by-an-automated-testing-tool/92920 -->

# [fuzzing-campaign] <short name> — <scope>

## 1. How this thread works
- This thread is the campaign ledger. Triage happens here: discuss, cluster
  shared root causes, claim findings.
- Findings are filed one issue per root-cause cluster, not per input. Only
  clusters signed off in this thread get filed as individual issues (using
  the fuzzer-found issue template), each carrying a backlink to this thread
  via the "fuzzing campaign" field.
- Backfill = set Status to `filed` and fill the Issue column below.
- Single one-off findings don't need a campaign thread: file them normally
  with the fuzzer-found template.
- Batches filed without a campaign thread fall under the rate-limiting RFC
  (https://discourse.llvm.org/t/limit-rate-of-ai-bot-assisted-issues-creation-without-triage-role/92792).

## 2. Campaign
- Reporter / contact:
- Target & scope: components exercised (passes, dialects, pipelines) and
  input constraints (e.g. valid IR only; dialect combinations deliberately
  excluded).
- llvm-project commit:
- Ledger: findings live inline (§5) or in an external repo — link it and
  state what it contains (full reports vs one-line entries; reproducers
  available on request).

## 3. Method
- Campaign type:
- Input format and corpus provenance:
- Environment & command:
- Detection oracle: crash / verifier failure / differential testing /
  semantic oracle.
- AI assistance (per the AI policy):

## 4. Ranking policy
- **High-priority criteria, stated explicitly**, e.g. (a) the pass runs in
  real pipelines on valid IR; (b) something real produces the input
  (frontend, importer, upstream pass); (c) the wrong behavior is
  unambiguous (not approximation precision or sign-of-zero).
- **Held back by default:** test passes/dialects, dialect mixing not
  designed to interoperate, invalid-input robustness (unless a usage
  scenario is argued).

## 5. Findings
> One row per distinct root-cause pattern, not per input. Discussion of a
> row happens under it; the filed issue stays factual.

| ID | Root-cause frame | Component / pass | Symptom (crash / miscompile / invalid IR) | Input produced by | Reproducer | Status | Issue |
|----|------------------|------------------|-------------------------------------------|-------------------|------------|--------|-------|
| F1 |                  |                  |                                           |                   |            | found  | —     |

Status: `found` → `clustered` → `endorsed` → `filed`. A row judged not
worth filing is marked `held back: <reason>`.

## 6. Related campaigns and prior work
> Prior campaign threads, meta-issues, or individual issues overlapping
> with this campaign, and how the overlap was checked.

## Notes
> Anything that does not fit a row: environment quirks, known
> false-positive classes, methodology changes mid-campaign.
