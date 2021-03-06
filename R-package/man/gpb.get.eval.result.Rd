% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gpb.Booster.R
\name{gpb.get.eval.result}
\alias{gpb.get.eval.result}
\title{Get record evaluation result from booster}
\usage{
gpb.get.eval.result(booster, data_name, eval_name, iters = NULL,
  is_err = FALSE)
}
\arguments{
\item{booster}{Object of class \code{gpb.Booster}}

\item{data_name}{name of dataset}

\item{eval_name}{name of evaluation}

\item{iters}{iterations, NULL will return all}

\item{is_err}{TRUE will return evaluation error instead}
}
\value{
vector of evaluation result
}
\description{
Get record evaluation result from booster
}
\examples{
\dontrun{
library(gpboost)
data(agaricus.train, package = "gpboost")
train <- agaricus.train
dtrain <- gpb.Dataset(train$data, label = train$label)
data(agaricus.test, package = "gpboost")
test <- agaricus.test
dtest <- gpb.Dataset.create.valid(dtrain, test$data, label = test$label)
params <- list(objective = "regression", metric = "l2")
valids <- list(test = dtest)
model <- gpb.train(params = params,
                   data = dtrain,
                   nrounds = 10,
                   valids = valids,
                   min_data = 1,
                   learning_rate = 1,
                   early_stopping_rounds = 5)
gpb.get.eval.result(model, "test", "l2")
}
}
