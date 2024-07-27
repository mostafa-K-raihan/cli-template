#!/usr/bin/env node

import { Command } from "commander";

// Declare the program
const program = new Command();

// Add actions to the program
program
  .argument("<string>", "string to log")
  .option("-c --capitalize", "capitalize the message")
  .action((message: string, opts: { capitalize?: boolean }) => {
    if (opts.capitalize) {
      console.log(message.toUpperCase());
    } else {
      console.log(message);
    }
  })
  .description("Say hello");

program
  .command("add <numbers...>")
  .action((numbers: string[]) => {
    const total = numbers.reduce((a, b) => a + parseInt(b), 0);
    console.log(`total = ${total}`);
  })
  .description("Add numbers and log the total");

program
  .command("get-max-number <numbers...>")
  .action((numbers: number[]) => {
    console.log(`Max: ${Math.max(...numbers)}`);
  })
  .description("Get max number");

// Execute the cli with provided arguments
program.parse(process.argv);
