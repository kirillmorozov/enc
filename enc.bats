#!/usr/bin/env bats
load bats-extra

@test "small boobies" {
  run ./enc.sh 'boobies'
  assert_output '5318008'
}

@test "big boobies" {
  run ./enc.sh 'BOOBIES'
  assert_output '5318008'
}

@test "small beghilosz" {
  run ./enc.sh 'beghilosz'
  assert_output '250714638'
}

@test "big BEGHILOSZ" {
  run ./enc.sh 'BEGHILOSZ'
  assert_output '250714638'
}

@test 'Letters outside mapped range' {
  run ./enc.sh 'hellow world!'
  assert_output '!D7ᴚ0M M07734'
}

@test 'Non-ASCII letters' {
  run ./enc.sh 'привет'
  assert_output 'ТЕВИРП'
}

@test "multiline" {
  run ./enc.sh 'calculator
spelling'
  assert_output '6N1773Ԁ5
ᴚ0┴∀7∩Ɔ7∀Ɔ'
}

@test "English alphabet split into several lines" {
  run ./enc.sh 'abcde
fghijk
lmnopq
rstuvw
xyz'
  assert_output '2⅄X
MΛ∩┴5ᴚ
ΌԀ0NW7
⋊ſ146Ⅎ
3DƆ8∀'
}
