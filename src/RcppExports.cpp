// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// XAJrun
List XAJrun(NumericVector PREC, NumericVector EVAP, NumericVector parameters, NumericVector UH);
RcppExport SEXP _XAJ_XAJrun(SEXP PRECSEXP, SEXP EVAPSEXP, SEXP parametersSEXP, SEXP UHSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< NumericVector >::type PREC(PRECSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type EVAP(EVAPSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type parameters(parametersSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type UH(UHSEXP);
    rcpp_result_gen = Rcpp::wrap(XAJrun(PREC, EVAP, parameters, UH));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_XAJ_XAJrun", (DL_FUNC) &_XAJ_XAJrun, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_XAJ(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}