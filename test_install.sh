suite() {
  # Run all functions that start with 'it_'
  for test_name in `grep '^it_' $0 | cut -d '(' -f 1`; do
    suite_addTest $test_name
  done
}

oneTimeSetUp() {
  echo "------------------"
  echo "Running test suite"
  echo "------------------"
}

setUp() {
  if [ -d sandbox ]; then rm -rf sandbox; fi
  mkdir sandbox

  cd sandbox

  touch file_not_to_link
  touch _file1_to_link
  touch _file2_to_link

  cd ..

  if `file_exists $HOME/.file1_to_link`; then rm $HOME/.file1_to_link; fi
  if `file_exists $HOME/.file2_to_link`; then rm $HOME/.file2_to_link; fi

  reset_globals
}

tearDown() {
  if `file_exists $HOME/.file1_to_link`; then rm $HOME/.file1_to_link; fi
  if `file_exists $HOME/.file2_to_link`; then rm $HOME/.file2_to_link; fi
}

. install.sh > /dev/null

# ----------- #
# create_link #
# ----------- #

it_creates_a_link() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link
  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"

}

# --------------- #
# ask_create_link #
# --------------- #

it_creates_a_link_if_answer_is_yes() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  assertEquals 'no' "$global_create_links"

  # Piping into a command always opens the command as a child process:
  # http://stackoverflow.com/a/9012932/100215
  # This would overshadow the scope of the $global_create_links variable and so
  # we have to use redirection instead of piping to programmatically give the
  # answer in the test.
  ask_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'y') > /dev/null

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"
  assertEquals 'no' "$global_create_links"

}

it_sets_global_answer_if_answer_is_all() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  assertEquals 'no' "$global_create_links"

  ask_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'a') > /dev/null

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"
  assertEquals 'yes' "$global_create_links"

}

it_does_not_create_a_link_if_answer_is_no() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  assertEquals 'no' "$global_create_links"

  ask_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'n') > /dev/null

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  assertEquals 'no' "$global_create_links"

}

# ----------------- #
# force_create_link #
# ----------------- #

it_force_creates_a_link() {

  touch $HOME/.file1_to_link
  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"

  force_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"

}

# --------------------- #
# ask_force_create_link #
# --------------------- #

it_force_creates_a_link_if_answer_is_yes() {

  touch $HOME/.file1_to_link

  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"
  assertEquals 'no' "$global_force_create_links"

  ask_force_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'y') > /dev/null

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"
  assertEquals 'no' "$global_force_create_links"

}

it_sets_global_answer_if_answer_is_no() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  assertEquals 'no' "$global_force_create_links"

  ask_force_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'a') > /dev/null

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"
  assertEquals 'yes' "$global_force_create_links"

}

it_does_not_force_create_an_existing_link_if_answer_is_no() {

  touch $HOME/.file1_to_link

  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"
  assertEquals 'no' "$global_force_create_links"

  ask_force_create_link $HOME/.file1_to_link `pwd`/sandbox/_file1_to_link < <(echo 'n') > /dev/null

  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"
  assertEquals 'no' "$global_force_create_links"

}

# --------------------------- #
# new_link_creation_is_forced #
# --------------------------- #

it_turns_true_by_commandline_argument_1() {

  assertEquals 'no' "$global_create_links"
  assertTrue 'should be true' "new_link_creation_is_forced --force-new-link-creation"

}

it_turns_true_by_global_setting_1() {

  global_create_links='yes'
  assertEquals 'yes' "$global_create_links"
  assertTrue 'should be true' "new_link_creation_is_forced"

}

# ------------------- #
# overwrite_is_forced #
# ------------------- #

it_turns_true_by_commandline_argument_2() {

  assertEquals 'no' "$global_force_create_links"
  assertTrue 'should be true' "overwrite_is_forced --force-overwrite"

}

it_turns_true_by_global_setting_2() {

  global_force_create_links='yes'
  assertEquals 'yes' "$global_force_create_links"
  assertTrue 'should be true' "overwrite_is_forced"

}

# ------------- #
# is_not_a_link #
# ------------- #

it_detects_non_links() {

  touch $HOME/.file1_to_link
  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"

  assertTrue '.file1_to_link is not a link' "is_not_a_link $HOME/.file1_to_link"

}

# -------------- #
# points_to_file #
# -------------- #

it_detects_if_a_symbolic_link_points_to_the_given_file() {

  local source="$HOME/.file1_to_link"
  local target="`pwd`/./././sandbox/_file1_to_link"
  local wrong_target="`pwd`/./././sandbox/_file2_to_link"

  ln -s $target $source

  assertTrue '.file1_to_link in homedir is a link', "[ -L $source ]"
  assertEquals "$target" "`readlink $source`"

  assertTrue 'should point to file' "points_to_file $source $target"
  assertFalse 'should not point to file' "points_to_file $source $wrong_target"

}

# ------------------- #
# list_linkable_files #
# ------------------- #

it_lists_all_files_to_link() {
  assertEquals "_file1_to_link
_file2_to_link" "`list_linkable_files sandbox`"
}

# ------------------ #
# link_linkable_file #
# ------------------ #

it_creates_new_links_if_forced() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  link_linkable_file sandbox _file1_to_link --force-new-link-creation
  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"

}

it_asks_before_creating_new_links() {

  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"
  echo 'n' | link_linkable_file sandbox _file1_to_link > /dev/null
  assertFalse '.file1_to_link in homedir does not exist', "file_exists $HOME/.file1_to_link"

}

it_overwrites_existing_files_if_forced() {

  touch $HOME/.file1_to_link
  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"

  link_linkable_file sandbox _file1_to_link --force-overwrite

  assertTrue '.file1_to_link in homedir is a link' "[ -L $HOME/.file1_to_link ]"

}

it_asks_before_overwriting_new_files() {

  touch $HOME/.file1_to_link
  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"

  echo 'n' | link_linkable_file sandbox _file1_to_link > /dev/null

  assertTrue '.file1_to_link in homedir is some file', "file_exists $HOME/.file1_to_link"
  assertFalse '.file1_to_link in homedir is not a link', "[ -L $HOME/.file1_to_link ]"

}

# ------------------- #
# link_linkable_files #
# ------------------- #

it_asks_before_linking_files_that_are_not_already_linked() {

  ln -s /dev/null "$HOME/.file1_to_link"

  assertTrue '.file1_to_link in homedir is a link', "[ -L $HOME/.file1_to_link ]"
  assertEquals '/dev/null' "`readlink $HOME/.file1_to_link`"
  assertFalse '.file2_to_link in homedir is not a link', "[ -L $HOME/.file2_to_link ]"

  echo 'n' | link_linkable_files sandbox > /dev/null

  assertTrue '.file1_to_link in homedir is a link', "[ -L $HOME/.file1_to_link ]"
  assertEquals '/dev/null' "`readlink $HOME/.file1_to_link`"
  assertFalse '.file2_to_link in homedir is not a link', "[ -L $HOME/.file2_to_link ]"

}

# ---- #
# main #
# ---- #

it_links_files() {

  assertFalse '.file1_to_link in homedir does not exist' "file_exists $HOME/.file1_to_link"
  assertFalse '.file2_to_link in homedir does not exist' "file_exists $HOME/.file2_to_link"

  echo 'y
y
' | main sandbox > /dev/null

  assertTrue '.file1_to_link in homedir is a link', "[ -L $HOME/.file1_to_link ]"
  assertTrue '.file2_to_link in homedir is a link', "[ -L $HOME/.file2_to_link ]"

}

. vendor/shunit2/src/shunit2

