% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survival_coxph_pairwise.R
\name{survival_coxph_pairwise}
\alias{survival_coxph_pairwise}
\alias{coxph_pairwise}
\alias{s_coxph_pairwise}
\alias{a_coxph_pairwise}
\title{Analyze a pairwise Cox-PH model}
\usage{
coxph_pairwise(
  lyt,
  vars,
  strata = NULL,
  control = control_coxph(),
  na_str = default_na_str(),
  nested = TRUE,
  ...,
  var_labels = "CoxPH",
  show_labels = "visible",
  table_names = vars,
  .stats = c("pvalue", "hr", "hr_ci"),
  .stat_names = NULL,
  .formats = NULL,
  .labels = NULL,
  .indent_mods = NULL
)

s_coxph_pairwise(
  df,
  .ref_group,
  .in_ref_col,
  .var,
  is_event,
  strata = NULL,
  strat = lifecycle::deprecated(),
  control = control_coxph(),
  ...
)

a_coxph_pairwise(
  df,
  ...,
  .stats = NULL,
  .stat_names = NULL,
  .formats = NULL,
  .labels = NULL,
  .indent_mods = NULL
)
}
\arguments{
\item{lyt}{(\code{PreDataTableLayouts})\cr layout that analyses will be added to.}

\item{vars}{(\code{character})\cr variable names for the primary analysis variable to be iterated over.}

\item{strata}{(\code{character} or \code{NULL})\cr variable names indicating stratification factors.}

\item{control}{(\code{list})\cr parameters for comparison details, specified by using the helper function
\code{\link[=control_coxph]{control_coxph()}}. Some possible parameter options are:
\itemize{
\item \code{pval_method} (\code{string})\cr p-value method for testing the null hypothesis that hazard ratio = 1. Default
method is \code{"log-rank"} which comes from \code{\link[survival:survdiff]{survival::survdiff()}}, can also be set to \code{"wald"} or \code{"likelihood"}
(from \code{\link[survival:coxph]{survival::coxph()}}).
\item \code{ties} (\code{string})\cr specifying the method for tie handling. Default is \code{"efron"},
can also be set to \code{"breslow"} or \code{"exact"}. See more in \code{\link[survival:coxph]{survival::coxph()}}.
\item \code{conf_level} (\code{proportion})\cr confidence level of the interval for HR.
}}

\item{na_str}{(\code{string})\cr string used to replace all \code{NA} or empty values in the output.}

\item{nested}{(\code{flag})\cr whether this layout instruction should be applied within the existing layout structure _if
possible (\code{TRUE}, the default) or as a new top-level element (\code{FALSE}). Ignored if it would nest a split.
underneath analyses, which is not allowed.}

\item{...}{additional arguments for the lower level functions.}

\item{var_labels}{(\code{character})\cr variable labels.}

\item{show_labels}{(\code{string})\cr label visibility: one of "default", "visible" and "hidden".}

\item{table_names}{(\code{character})\cr this can be customized in the case that the same \code{vars} are analyzed multiple
times, to avoid warnings from \code{rtables}.}

\item{.stats}{(\code{character})\cr statistics to select for the table.

Options are: \verb{'pvalue', 'hr', 'hr_ci', 'n_tot', 'n_tot_events'}}

\item{.stat_names}{(\code{character})\cr names of the statistics that are passed directly to name single statistics
(\code{.stats}). This option is visible when producing \code{\link[rtables:data.frame_export]{rtables::as_result_df()}} with \code{make_ard = TRUE}.}

\item{.formats}{(named \code{character} or \code{list})\cr formats for the statistics. See Details in \code{analyze_vars} for more
information on the \code{"auto"} setting.}

\item{.labels}{(named \code{character})\cr labels for the statistics (without indent).}

\item{.indent_mods}{(named \code{integer})\cr indent modifiers for the labels. Defaults to 0, which corresponds to the
unmodified default behavior. Can be negative.}

\item{df}{(\code{data.frame})\cr data set containing all analysis variables.}

\item{.ref_group}{(\code{data.frame} or \code{vector})\cr the data corresponding to the reference group.}

\item{.in_ref_col}{(\code{flag})\cr \code{TRUE} when working with the reference level, \code{FALSE} otherwise.}

\item{.var}{(\code{string})\cr single variable name that is passed by \code{rtables} when requested
by a statistics function.}

\item{is_event}{(\code{flag})\cr \code{TRUE} if event, \code{FALSE} if time to event is censored.}

\item{strat}{\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}} Please use the \code{strata} argument instead.}
}
\value{
\itemize{
\item \code{coxph_pairwise()} returns a layout object suitable for passing to further layouting functions,
or to \code{\link[rtables:build_table]{rtables::build_table()}}. Adding this function to an \code{rtable} layout will add formatted rows containing
the statistics from \code{s_coxph_pairwise()} to the table layout.
}

\itemize{
\item \code{s_coxph_pairwise()} returns the statistics:
\itemize{
\item \code{pvalue}: p-value to test the null hypothesis that hazard ratio = 1.
\item \code{hr}: Hazard ratio.
\item \code{hr_ci}: Confidence interval for hazard ratio.
\item \code{n_tot}: Total number of observations.
\item \code{n_tot_events}: Total number of events.
}
}

\itemize{
\item \code{a_coxph_pairwise()} returns the corresponding list with formatted \code{\link[rtables:CellValue]{rtables::CellValue()}}.
}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#stable}{\figure{lifecycle-stable.svg}{options: alt='[Stable]'}}}{\strong{[Stable]}}

The analyze function \code{\link[=coxph_pairwise]{coxph_pairwise()}} creates a layout element to analyze a pairwise Cox-PH model.

This function can return statistics including p-value, hazard ratio (HR), and HR confidence intervals from both
stratified and unstratified Cox-PH models. The variable(s) to be analyzed is specified via the \code{vars} argument and
any stratification factors via the \code{strata} argument.
}
\section{Functions}{
\itemize{
\item \code{coxph_pairwise()}: Layout-creating function which can take statistics function arguments
and additional format arguments. This function is a wrapper for \code{\link[rtables:analyze]{rtables::analyze()}}.

\item \code{s_coxph_pairwise()}: Statistics function which analyzes HR, CIs of HR, and p-value of a Cox-PH model.

\item \code{a_coxph_pairwise()}: Formatted analysis function which is used as \code{afun} in \code{coxph_pairwise()}.

}}
\examples{
library(dplyr)

adtte_f <- tern_ex_adtte \%>\%
  filter(PARAMCD == "OS") \%>\%
  mutate(is_event = CNSR == 0)

df <- adtte_f \%>\% filter(ARMCD == "ARM A")
df_ref_group <- adtte_f \%>\% filter(ARMCD == "ARM B")

basic_table() \%>\%
  split_cols_by(var = "ARMCD", ref_group = "ARM A") \%>\%
  add_colcounts() \%>\%
  coxph_pairwise(
    vars = "AVAL",
    is_event = "is_event",
    var_labels = "Unstratified Analysis"
  ) \%>\%
  build_table(df = adtte_f)

basic_table() \%>\%
  split_cols_by(var = "ARMCD", ref_group = "ARM A") \%>\%
  add_colcounts() \%>\%
  coxph_pairwise(
    vars = "AVAL",
    is_event = "is_event",
    var_labels = "Stratified Analysis",
    strata = "SEX",
    control = control_coxph(pval_method = "wald")
  ) \%>\%
  build_table(df = adtte_f)

}
\keyword{internal}
