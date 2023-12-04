module main

import os

pub fn part_one(file string) {
	cards := file.split('\n')
	mut values := []int{}

	for _, card in cards {
		mut winning_numbers_in_card := 0

		numbers := card.split(': ')[1]
		winning_numbers := numbers.split(' | ')[0]
		card_numbers := numbers.split(' | ')[1]

		for _, card_num in card_numbers.split(' ') {
			if card_num == '' {
				continue
			}

			for _, winning_num in winning_numbers.split(' ') {
				if card_num == '' {
					continue
				}

				if card_num == winning_num {
					winning_numbers_in_card++
				}
			}
		}

		mut value := if winning_numbers_in_card == 0 { 0 } else { 1 }
		for _ in value .. winning_numbers_in_card {
			value *= 2
		}

		values << value
	}

	mut result := 0
	for value in values {
		result += value
	}

	println('Part One: ${result}')
}

pub fn part_two(file string) {
	println('Part Two: N/A')
}

fn main() {
	// file_name := 'sample.txt'
	file_name := 'input.txt'

	mut file := os.read_file(file_name) or {
		println(err)
		return
	}

	part_one(file)
	part_two(file)
}
