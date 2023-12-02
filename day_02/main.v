module main

import os
import strconv
import arrays

pub fn part_one(file string) {
	max_red := 12
	max_green := 13
	max_blue := 14

	games := file.split('\n')
	mut possible_games := []int{}

	for _, game in games {
		game_id := game.split(': ')[0].split(' ')[1]
		mut possible_sets := []bool{}

		sets := game.split(': ')[1].split('; ')
		for _, set in sets {
			cubes_set := set.split(', ')
			mut is_set_possible := false

			for _, cubes in cubes_set {
				cubes_number := strconv.atoi(cubes.split(' ')[0]) or {
					println(err)
					return
				}
				cubes_color := cubes.split(' ')[1]

				match cubes_color {
					'red' {
						if cubes_number <= max_red {
							is_set_possible = true
						} else {
							is_set_possible = false
							break
						}
					}
					'green' {
						if cubes_number <= max_green {
							is_set_possible = true
						} else {
							is_set_possible = false
							break
						}
					}
					'blue' {
						if cubes_number <= max_blue {
							is_set_possible = true
						} else {
							is_set_possible = false
							break
						}
					}
					else {
						return
					}
				}
			}

			possible_sets << is_set_possible
		}

		if false !in possible_sets {
			possible_games << strconv.atoi(game_id) or {
				println(err)
				return
			}
		}
	}

	mut result := 0
	for _, value in possible_games {
		result += value
	}

	println('Part One: ${result}')
}

pub fn part_two(file string) {
	games := file.split('\n')
	mut powers := []int{}

	for _, game in games {
		mut game_power := 0

		mut red_arr := []int{}
		mut green_arr := []int{}
		mut blue_arr := []int{}

		sets := game.split(': ')[1].split('; ')
		for _, set in sets {
			cubes_set := set.split(', ')

			for _, cubes in cubes_set {
				cubes_number := strconv.atoi(cubes.split(' ')[0]) or {
					println(err)
					return
				}
				cubes_color := cubes.split(' ')[1]

				match cubes_color {
					'red' { red_arr << cubes_number }
					'green' { green_arr << cubes_number }
					'blue' { blue_arr << cubes_number }
					else { return }
				}
			}
		}

		max_red := arrays.max(red_arr) or {
			println(err)
			return
		}

		max_green := arrays.max(green_arr) or {
			println(err)
			return
		}

		max_blue := arrays.max(blue_arr) or {
			println(err)
			return
		}

		game_power = max_red * max_green * max_blue
		powers << game_power
	}

	mut result := 0
	for _, value in powers {
		result += value
	}

	println('Part Two: ${result}')
}

fn main() {
	file_name := 'input.txt'
	// file_name := 'sample.txt'

	mut file := os.read_file(file_name) or {
		println(err)
		return
	}

	part_one(file)
	part_two(file)
}
