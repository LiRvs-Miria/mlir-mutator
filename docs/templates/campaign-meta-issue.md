# [fuzzing-campaign] <short name> — <goal>

## Usage guidance

- This thread is the campaign's ledger and its legitimate intake channel.
  It carries only the macro level: goals, scope, criteria (agreed in
  step 3), and batch sign-off records (step 4). Methods, reproduction
  details, root-cause diagnosis, environment, and similar details do not go
  in the thread; they go into the documentation of the campaign bugs repo.
- The findings list lives in an external repo under your control; this
  thread only links to it. The list doubles as the proposer's own
  management tool and as the concrete reference for the criteria
  discussion. Each finding carries a unique ID (format up to you),
  referenced by sign-offs. IDs must be self-resolving: for a precedent, see
  [wildoranges/mlir-bug-reports](https://github.com/wildoranges/mlir-bug-reports)
  — report-filename slugs (`high-priority/reports/`) are self-describing;
  numbered IDs like `F010` (the id column of `lower-priority/findings.csv`)
  must be paired with a one-line summary per ID (that file's id,title
  columns are exactly this structure).
- Agreeing on criteria and permitting filing are two separate decisions:
  this thread settles the criteria (what counts as an important bug in this
  campaign); whether a batch may enter the tracker is decided by
  maintainers/community in the thread, batch by batch — not by the
  proposer's private reading of the criteria.
- A batch filed without this thread or without a batch sign-off receipt
  falls under the rate-limiting RFC
  (https://discourse.llvm.org/t/limit-rate-of-ai-bot-assisted-issues-creation-without-triage-role/92792).
- A single one-off finding is filed directly as an issue with the
  fuzzer-found template (llvm/llvm-project#244657); its quality
  requirements follow that template and are not restated here.

## Procedure

### 1. Set up a campaign bugs repo

> Please confirm you have created the campaign bugs repo and paste its
> external link here. Content shape (full reports / one-line entries); how
> to obtain reproducers; method and environment details go into the repo
> docs.

### 2. Open this thread under the `fuzzing-campaign` tag

```auto
FILE-ME:
- Reporter / contact:
- Goals and scope: components covered (passes, dialects, pipelines); input
  constraints (e.g., valid IR only; dialect combinations deliberately
  excluded); detection oracle type (crash / verifier failure / differential
  testing / semantic oracle).
- AI involvement (per the AI policy):
- llvm-project commit:
```

### 3. Agree on the criteria — the core content of this thread

List and number them explicitly.

> Example shape:
>
> - (a) the pass runs on valid IR in real pipelines;
> - (b) the triggering input has a real producer (a frontend, an importer,
>   or an upstream pass such as the vectorizer);
> - (c) the wrong behavior is unambiguous (not approximation precision or
>   the sign of a zero);

### 4. Before filing a high-priority batch, post a sign-off in this thread: one batch, one sign-off, one record

Use this sign-off table (list ID = the unique ID of a finding in the repo,
self-resolvable, see Usage guidance):

| List ID | Criteria (step 3) | File? | Issue (backfill after filing) |
| --- | --- | --- | --- |
| F010 | (a)(b)(c) | pending | — |

`File?` is decided by maintainers/community in the sign-off.

### 5. After sign-off, file the issues one by one.

> Each issue uses the fuzzer-found template and must fill in the "fuzzing
> campaign" section with the URL of this batch's sign-off record post in
> this thread (the specific post, not the thread top).

### 6. Backfill the issue links into the sign-off record

> Put each issue link into the Issue column of the step 4 table.

### 7. Tier the remaining findings

> Low priority stays in your repo, unfiled (keeps the tracker digestible).
> Mid priority: under discussion
> (https://discourse.llvm.org/t/seeking-advice-on-reporting-100-mlir-bugs-found-by-an-automated-testing-tool/92920/16).

## Notes

> Related campaigns and prior work: prior campaign threads, meta-issues, or
> individual issues overlapping this campaign, and how the overlap was
> checked.
>
> Anything that fits nowhere else: known false-positive classes,
> mid-campaign methodology changes.
