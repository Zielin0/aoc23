module main

import os
import strconv

fn part_one(file string) {
	lines := file.split('\n')
	mut values := []int{}

	for _, line in lines {
		chars := line.split('')
		mut nums := []string{}

		for _, chr in chars {
			_ := strconv.atoi(chr) or { continue }

			nums << chr
		}

		line_value := '${nums.first()}${nums.last()}'
		line_value_number := strconv.atoi(line_value) or {
			println(err)
			return
		}

		values << line_value_number
	}

	mut result := 0
	for _, value in values {
		result += value
	}

	println('Part One: ${result}')
}

fn part_two(file string) {
	word_to_number := {
		'one':   1
		'two':   2
		'three': 3
		'four':  4
		'five':  5
		'six':   6
		'seven': 7
		'eight': 8
		'nine':  9
	}

	lines := file.split('\n')
	mut values := []int{}

	for _, line in lines {
		mut final_line := line

		for key, value in word_to_number {
			if line.contains(key) {
				final_line = final_line.replace(key, '${key.substr(0, 1)}${value}${key.substr(key.len - 1,
					key.len)}')
			}
		}

		chars := final_line.split('')
		mut nums := []string{}

		for _, chr in chars {
			_ := strconv.atoi(chr) or { continue }

			nums << chr
		}

		line_value := '${nums.first()}${nums.last()}'
		line_value_number := strconv.atoi(line_value) or {
			println(err)
			return
		}

		values << line_value_number
	}

	mut result := 0
	for _, value in values {
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
