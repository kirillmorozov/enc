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
  assert_output '!D7R0W W07734'
}

@test 'Non-ASCII letters' {
  run ./enc.sh 'привет'
  assert_output 'ТЕВИРП'
}

@test "multiline" {
  run ./enc.sh 'calculator
spelling'
  assert_output '6N1773P5
R0TA7UC7AC'
}
