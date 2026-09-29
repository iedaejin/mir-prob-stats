# Build the .txt a student uploads after a learnr lab.
# The file records name, date, each question, and the submitted answer.

`%||%` <- function(x, y) if (is.null(x)) y else x

lab_submission_filename <- function(name, lab_id) {
  safe <- gsub("[^A-Za-z0-9]+", "_", trimws(name %||% ""))
  safe <- gsub("^_|_$", "", safe)
  if (!nzchar(safe)) safe <- "student"
  paste0(safe, "_", lab_id, ".txt")
}

format_answer <- function(item) {
  if (is.null(item) || is.null(item$answer) || !length(item$answer)) {
    return("(not answered)")
  }
  ans <- paste(as.character(item$answer), collapse = " | ")
  if (!nzchar(trimws(ans))) "(not answered)" else ans
}

# A written answer is stored. It is not auto-graded.
# An empty box is the only response marked incomplete.
open_answer <- function() {
  learnr::answer_fn(function(value) {
    text <- trimws(paste(as.character(value), collapse = " "))
    if (!nzchar(text) || text == "NA") {
      learnr::incorrect("Write a short answer. It is recorded, not graded.")
    } else {
      learnr::correct("Recorded.")
    }
  })
}

write_lab_submission <- function(path, name, lab_id, lab_title, state, prompts) {
  name <- trimws(name %||% "")
  if (!nzchar(name)) name <- "(name missing)"
  lines <- c(
    paste("Name:", name),
    paste("Date:", format(Sys.Date(), "%Y-%m-%d")),
    paste("Lab:", lab_id),
    paste("Title:", lab_title),
    ""
  )
  for (id in names(prompts)) {
    lines <- c(
      lines,
      paste0("Question: ", prompts[[id]]),
      paste0("Answer: ", format_answer(state[[id]])),
      ""
    )
  }
  writeLines(lines, path, useBytes = TRUE)
  invisible(path)
}

if (sys.nframe() == 0L && !interactive()) {
  tmp <- tempfile(fileext = ".txt")
  write_lab_submission(
    path = tmp,
    name = "Ada Lovelace",
    lab_id = "lab00",
    lab_title = "Welcome to R",
    state = list(q1 = list(answer = "a country")),
    prompts = c(q1 = "What is one row?")
  )
  txt <- readLines(tmp)
  stopifnot(any(grepl("^Name: Ada Lovelace$", txt)))
  stopifnot(any(grepl("^Date: ", txt)))
  stopifnot(any(grepl("^Answer: a country$", txt)))
  message("lab_submission check ok")
}
