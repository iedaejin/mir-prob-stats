# Build the .txt a student uploads after a learnr lab.
# The file records a new id, name, date and time, each question, and the submitted answer.

`%||%` <- function(x, y) if (is.null(x)) y else x

lab_submission_filename <- function(name, lab_id) {
  safe <- gsub("[^A-Za-z0-9]+", "_", trimws(name %||% ""))
  safe <- gsub("^_|_$", "", safe)
  if (!nzchar(safe)) safe <- "student"
  paste0(safe, "_", lab_id, ".txt")
}

# New on every download. The clock plus four random bytes is enough for one class.
lab_submission_id <- function() {
  token <- paste(sprintf("%02x", sample(0:255, 4, replace = TRUE)), collapse = "")
  paste0(format(Sys.time(), "%Y%m%d-%H%M%S"), "-", token)
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
    paste("ID:", lab_submission_id()),
    paste("Name:", name),
    paste("Date:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z")),
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
  id1 <- sub("^ID: ", "", grep("^ID: ", txt, value = TRUE))
  write_lab_submission(
    path = tmp,
    name = "Ada Lovelace",
    lab_id = "lab00",
    lab_title = "Welcome to R",
    state = list(q1 = list(answer = "a country")),
    prompts = c(q1 = "What is one row?")
  )
  txt2 <- readLines(tmp)
  id2 <- sub("^ID: ", "", grep("^ID: ", txt2, value = TRUE))
  stopifnot(grepl("^[0-9]{8}-[0-9]{6}-[0-9a-f]{8}$", id1))
  stopifnot(id1 != id2)
  stopifnot(any(grepl("^Name: Ada Lovelace$", txt)))
  stopifnot(any(grepl("^Date: [0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} ", txt)))
  stopifnot(any(grepl("^Answer: a country$", txt)))
  message("lab_submission check ok")
}
